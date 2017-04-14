# frozen_string_literal: true

module Jackasset
  class AssetsChecker
    attr_reader :host, :num_issues, :source_dir

    def initialize(host:, source_dir:)
      @host = host
      @source_dir = source_dir
      @num_issues = 0
    end

    def self.call(host: 'http://localhost:8080', source_dir:)
      new(host: host, source_dir: source_dir).call
    end

    def call
      img_urls
      threads = img_urls.each_with_object([]) do |url, threads|
        next unless url.match?(/\Ahttp/)
        threads << Thread.new { check_url url }
      end
      threads.each(&:join)
      puts "Finished checking #{img_urls.count} URLs and found #{num_issues} issues"
    end

    private

    def check_url(url)
      display_result Jackasset::UrlChecker.new(url: url).call
    end

    def clean_url(url)
      cleaned_url = url.gsub('src=', '').gsub('"', '').gsub(/\A\//, '').strip
      cleaned_url.match?(/\Ahttp/) ? cleaned_url : "#{host}/#{cleaned_url}"
    end

    def display_result(response)
        msg = " #{response.code} #{response.message} #{response.uri.to_s}"
        case response
        when Net::HTTPSuccess, Net::HTTPRedirection
          puts msg.green
        else
          @num_issues += 1
          puts msg.red
        end
      end

    def img_urls
      @img_urls ||= Dir["#{source_dir}/**/*.html"].each_with_object([]) do |path, urls|
        file_content = File.read path
        file_content.scan(/src=\"\S*\"/).flatten.each do |src|
          urls << clean_url(src)
        end
      end
    end
  end
end
