# frozen_string_literal: true

require 'singleton'

# stores PageStats
class PageStatsRepository
  include Singleton
  attr_reader :stats

  def initialize
    @stats = []
  end

  def write=(row)
    raise TypeError unless row.is_a?(PageStat)

    @stats << row
  end
end
