# frozen_string_literal: true

# top level class for list decoration
# follows a simple decorator pattern
class BaseDecorator
  class << self
    def decorate(stats)
      new(stats).decorate
    end
  end

  def initialize(stats)
    @stats = stats
  end

  # formats the collection of page views to preferred format
  def decorate
    stats.map do |stat|
      format_row(stat.page, stat.visits)
    end
  end

  private

  attr_reader :stats

  # override this method for a different preferred format
  def format_row(_page, _visits)
    raise NotImplementedError
  end
end
