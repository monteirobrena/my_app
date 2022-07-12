class HomeController < ApplicationController
  def index
    Appsignal.send_error("My Error")
    Appsignal.send_error({ error: "My formatted error.", message: "Specific content"})
    nil.object
  end
end
