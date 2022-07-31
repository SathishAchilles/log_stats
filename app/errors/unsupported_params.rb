# frozen_string_literal: true

require 'json'

# represents Missing File errors in general
class UnsupportedParams < StandardError
  attr_reader :params

  def initialize(msg = 'Unsupported Params', params:)
    @params = params
    msg = "#{msg}: #{params.to_json}"
    super(msg)
  end
end
