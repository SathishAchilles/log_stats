# frozen_string_literal: true

# endpoint to access the stats
class PageStatsController
  SUPPORTED_QUERIES = %w[popular unique].freeze
  SUPPORTED_SORTS = %w[desc].freeze

  def initialize(query: 'popular', order: 'desc')
    @query = query
    @order = order
  end

  def index
    PageStatsParamsValidator.validate!(query: query, order: order)
    @page_stats = decorator.decorate(collect_page_stats)
    render_to_s
  end

  private

  attr_reader :query, :order, :page_stats

  def collect_page_stats
    stats = query_builder.query(PageStatsRepository.instance.stats)
    sorter.sort(stats)
  end

  def render_to_s
    page_stats.join
  end

  def query_builder
    Module.const_get("#{query.capitalize}QueryBuilder")
  end

  def sorter
    Module.const_get("#{order.capitalize}Sorter")
  end

  def decorator
    Module.const_get("#{query.capitalize}StatsDecorator")
  end
end
