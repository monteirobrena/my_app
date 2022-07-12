class HomeController < ApplicationController
  def index
    raise CustomException, "My error"

    nil.object
  end
end
