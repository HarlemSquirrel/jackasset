# frozen_string_literal: true

module Jackasset
  # The main class
  class Cli
    BAD_CALL_MSG = 'Please call with directory of HTML files'
    RESULTS_HEADERS = %w(Response URL).freeze

    def call(source_dir:)
      Jackasset::AssetsChecker.call source_dir: source_dir
    end

    def self.call
      if ARGV.length == 1
        new.call source_dir: ARGV.first
      else
        puts BAD_CALL_MSG.red
      end
    end
  end
end
