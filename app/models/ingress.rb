# Model to represent Ingress requests
class Ingress
  attr_reader :ip

  def initialize(ip)
    @ip = ip
  end
end
