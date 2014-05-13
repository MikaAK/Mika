class PagesController < ApplicationController

  def home

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
