class PagesController < ApplicationController
  def home
    @current_uri = request.env['PATH_INFO']
  end

  def contact
    @message = Message.new
  end

  def privacy

  end

  def about
  end

  def terms_of_service
  end
end
