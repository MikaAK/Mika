class ContactMailer < ActionMailer::Base
  default to: 'me@mikakalathil.ca'
  def contact_me(message)
    @message = message
    mail(:from => message.email,
         :subject => message.name + " - " + message.subject,
         :body => message.body).deliver
  end
end
