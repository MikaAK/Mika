class MessagesController < ApplicationController
  def contact
    @message = Message.new(params[:message])
    if @message.valid?
      ContactMailer.contact_me(@message)
      redirect_to contact_path, :notice => 'Message was sent successfully.'
    else
      render :file => 'pages/contact'
    end
  end
end