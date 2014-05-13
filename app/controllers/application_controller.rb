class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_current_uri

  
  private 
   
  def set_current_uri    
    @current_uri = request.env['PATH_INFO']
  end
end
