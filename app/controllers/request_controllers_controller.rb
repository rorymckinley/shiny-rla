class RequestControllersController < ApplicationController
  def index
    render :json => Request.get_distinct_controllers
  end
end
