# Interface for validators
class BaseValidator
  class << self
    def validate!(input)
      new(input).validate
    end
  end

  def initialize(input)
    @input = input
  end

  def validate
    raise NotImplementedError
  end

  private

  attr_reader :input
end
