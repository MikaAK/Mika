class MessagesController < ApplicationController
  def contact
    @message = Message.new(params[:message])
    respond_to do |format|
      if @message.valid?
        ContactMailer.contact_me(@message)
        format.html { redirect_to contact_path, notice: 'Message was sent successfully.' }
        format.js { render nothing: true }																																																																																							
      else
        format.html { redirect_to contact_path }
        format.js { render nothing: true }
      end
    end
  end
end