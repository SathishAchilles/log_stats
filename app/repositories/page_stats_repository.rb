# frozen_string_literal: true

require 'singleton'

# stores PageStats
class PageStatsRepository
  include Singleton
  attr_reader :stats

  def initialize
    @stats = {}
  end

  def find(page)
    @stats[page]
  end

  def write=(row)
    raise TypeError unless row.is_a?(PageStat)

    @stats[row.page] = row
  end
end
