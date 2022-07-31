# interface for Service classes
class ApplicationService
  class << self
    def execute(*args, &block)
      new(*args, &block).execute
    end
  end

  def execute
    raise NotImplementedError
  end
end
