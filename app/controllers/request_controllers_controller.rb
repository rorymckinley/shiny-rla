class RequestControllersController < ApplicationController
  def index
    render :json => Request.get_distinct_controllers
  end
  def show
    render :json => Request.get_distinct_methods_for(params[:id])
  end
end
