# frozen_string_literal: true

# Helps query unique records
class UniqueQueryBuilder < BaseQueryBuilder
  def query
    data.map do |stat|
      struct_from(page: stat.page, visits: stat.ingresses.uniq(&:ip).count)
    end
  end
end
