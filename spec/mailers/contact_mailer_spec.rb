require "spec_helper"

describe ContactMailer do
  describe 'contact_me' do
    let(:mail) { ContactMailer.contact_me('test@test.ca',
                                          'This is a test',
                                          'This is the body of the test ')
    }

    it 'renders the subject' do
      mail.subject == "This is a test"
    end

    it 'renders the sender email' do
      mail.from == ['test@test.ca']
    end

    it 'renders the receiver email' do
      mail.to == ['me@mikakalathil.ca']
    end
  end
end