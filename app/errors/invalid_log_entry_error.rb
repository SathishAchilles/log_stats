# frozen_string_literal: true

# represents Type Errors for mismatched associations in general
class InvalidLogEntryError < StandardError
  attr_reader :entry

  def initialize(msg = 'Invalid Log Entry', entry:)
    @entry = entry
    msg = "#{msg}: #{entry}"
    super(msg)
  end
end
