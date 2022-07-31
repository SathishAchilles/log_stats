# frozen_string_literal: true

# decorates stats in the format for Unique Stats
class UniqueStatsDecorator < BaseDecorator
  private

  def format_row(page, visits)
    format("%<page>s\s%<visits>s\sunique\sviews\n", page: page, visits: visits.to_s)
  end
end
