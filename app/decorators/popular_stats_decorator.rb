# frozen_string_literal: true

# decorates stats in the format for Popular Stats
class PopularStatsDecorator < BaseDecorator
  private

  def format_row(page, visits)
    format("%<page>s\s%<visits>s\svisits\n", page: page, visits: visits.to_s)
  end
end
