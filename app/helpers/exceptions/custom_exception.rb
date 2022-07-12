class CustomException < StandardError
  def initialize(msg)
    Appsignal.send_error(self)
  end
end
