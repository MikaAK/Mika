class ContactPreview < ActionMailer::Preview
def contact_me
  message = Message.new(:name => 'Test', :email => 'Test@test.ca', :subject => 'subject is here', :body => 'body is here')
  mailer = ContactMailer.contact_me(message)
end


end