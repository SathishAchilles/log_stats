# Validates Params for the PageStatsController
class PageStatsParamsValidator < BaseValidator
  def validate
    input_type!
    supported_query!
  end

  private

  def input_type!
    raise UnsupportedParams.new(params: input) unless input.is_a?(Hash)
  end

  def supported_query!
    raise UnsupportedParams.new(params: input) unless PageStatsController::SUPPORTED_QUERIES.include?(input[:query])
  end

  def supporter_order!
    raise UnsupportedParams.new(params: input) unless PageStatsController::SUPPORTED_SORTS.include?(input[:order])
  end
end
