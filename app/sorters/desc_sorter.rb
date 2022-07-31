# sorts stats in descending order
class DescSorter
  class << self
    def sort(stats)
      stats.sort_by(&:visits).reverse
    end
  end
end
