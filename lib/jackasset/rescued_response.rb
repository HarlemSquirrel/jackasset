# frozen_string_literal: true

module Jackasset
  class RecuedResponse
    attr_reader :code, :message, :uri

    def initialize(code:, message:, uri:)
      raise TypeError, "#{uri} is not a URI" unless uri.is_a? URI
      @code = code
      @message = message
      @uri = uri
    end
  end
end
