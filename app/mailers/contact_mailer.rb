class ContactMailer < ActionMailer::Base
  default to: 'me@mikakalathil.ca'
  def contact_me(message)
    mail(from: message.email,
         subject: message.subject,
         body: message.body)
  end
end
