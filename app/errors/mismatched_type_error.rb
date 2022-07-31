# frozen_string_literal: true

# represents Type Errors for mismatched associations in general
class MismatchedTypeError < StandardError
  attr_reader :type

  def initialize(msg = 'Unexpected Type', type:)
    @type = type
    msg = "#{msg}: #{type}"
    super(msg)
  end
end
