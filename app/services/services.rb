# Service is parent class of all services
class Services
  def call(*_args)
    self
  end
  
  def self.call(*args)
    new(*args).call
  end

end
