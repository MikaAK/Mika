class ContactMailer < ActionMailer::Base
  default to: 'me@mikakalathil.ca'
  def contact_me(sender_address, subject, email_body)
    mail(from: sender_address,
         subject: subject,
         body: email_body)
  end
end
