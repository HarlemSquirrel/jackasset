# frozen_string_literal: true

module Jackasset
  # The main class
  class Cli
    BAD_CALL_MSG = 'Usage: jackasset [-p PORT] path/to/html_files'

    def call(host: 'http://localhost:8080', source_dir:)
      Jackasset::AssetsChecker.call host: host, source_dir: source_dir
    end

    def self.call
      if ARGV.length == 1
        new.call source_dir: ARGV.first
      elsif ARGV.length == 3 && ARGV.first == '-p' && ARGV[1].match?(/\A\d{4}\z/)
        new.call host: "http://localhost:#{ARGV[1]}", source_dir: ARGV.last
      else
        puts BAD_CALL_MSG.red
      end
    end
  end
end
