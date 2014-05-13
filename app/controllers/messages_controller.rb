class MessagesController < ApplicationController
  def contact
    @message = Message.new(params[:message])
    respond_to do |format|
      if @message.valid?
        flash.now[:notice] = 'Message was sent successfully.'
        ContactMailer.contact_me(@message)
        format.html { redirect_to contact_path, notice: 'Message was sent successfully.' }
        format.js 																																																																																					
      else
        format.html { redirect_to contact_path }
        format.js 
      end
    end
  end
end