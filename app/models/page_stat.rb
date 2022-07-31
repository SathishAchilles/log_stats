# Model to represent Page Statistics
class PageStat
  attr_reader :page, :ingresses, :visits

  def initialize(page)
    @page = page
    @ingresses = []
    @visits = 0
  end

  # @param ingress [Ingress] associates ingresses to a page
  # @note implicitly increments visits
  def ingresses=(ingress)
    raise MismatchedTypeError.new(type: ingress.class) unless ingress.is_a?(Ingress)

    @ingresses << ingress
    @visits += 1
  end
end
