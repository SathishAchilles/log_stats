# handles validations for Log Record
# Accepts array of column values as input
class LogRecordValidator < BaseValidator
  def validate
    input_type!
    input_parity!
    input_presence!
  end

  private

  attr_reader :input

  def input_type!
    raise InvalidLogEntryError.new(entry: input) unless input.is_a?(Array)
  end

  def input_parity!
    raise InvalidLogEntryError.new(entry: input.join('')) unless input.count == 2
  end

  def input_presence!
    raise InvalidLogEntryError.new(entry: input.join('')) if input.any? { |column| column.nil? || column.empty? }
  end
end
