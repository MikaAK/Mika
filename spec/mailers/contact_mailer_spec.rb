require "spec_helper"

describe ContactMailer do
  describe 'contact_me' do
    let(:mail) {
      @message = Message.new
      @message.name = 'Bob'
      @message.email = 'test@test.ca'
      @message.subject = 'This is a test'
      @message.body = 'Testing the body of the message'
      ContactMailer.contact_me(@message)
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

describe Message do
  describe 'Validations' do

    before {
      @message = Message.new
      @message.name = 'John Doe'
      @message.email = 'john@doe.ca'
      @message.subject = 'Test Subject'
      @message.body = 'Test Body'
    }

    subject{ @message }

    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:subject) }
    it { should respond_to(:body) }
    it { should be_valid }

    describe 'has name' do
      before{ @message.name = '' }
      it { should_not be_valid }
    end

    describe "has email" do
      before{ @message.email = '' }
      it { should_not be_valid }
    end

    describe "has body" do
      describe 'above 20 characters' do
        before { @message.body = '' }

        it { should_not be_valid }
      end

      describe "below 350 characters" do
        before { @message.body = 'a'*360 }

        it { should be_valid }
      end
    end
  end
end
