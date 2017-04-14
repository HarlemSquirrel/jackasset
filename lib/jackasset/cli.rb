# frozen_string_literal: true

module Jackasset
  # The main class
  class Cli
    BAD_CALL_MSG = 'Usage: jackasset [-p PORT] path/to/html_files'
    PORT_RANGE = 1..65535

    def self.call
      new.call
    end

    def call
      if valid_args_without_port?
        check_assets source_dir: ARGV.first
      elsif valid_args_with_port?
        check_assets host: "http://localhost:#{ARGV[1]}", source_dir: ARGV.last
      else
        puts BAD_CALL_MSG.red
      end
    end

    private

    def check_assets(args)
      Jackasset::AssetsChecker.call args
    end

    def valid_args_with_port?
      ARGV.length == 3 && valid_port_arg? && valid_dir_arg?
    end

    def valid_args_without_port?
      ARGV.length == 1 && valid_dir_arg?
    end

    def valid_dir_arg?
      File.directory? ARGV.last
    end

    def valid_port_arg?
      ARGV.first == '-p' && PORT_RANGE.include?(ARGV[1])
    end
  end
end
