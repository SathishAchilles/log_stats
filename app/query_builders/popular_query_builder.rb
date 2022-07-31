# frozen_string_literal: true

# Helps query all popular records
class PopularQueryBuilder < BaseQueryBuilder
  def query
    data.map { |stats| struct_from(page: stats.page, visits: stats.visits) }
  end
end
