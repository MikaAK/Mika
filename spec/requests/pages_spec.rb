require 'spec_helper'

describe "Pages" do

  subject { page }

  describe 'Home Page' do

    before { visit root_path }

    it 'has name' do
      should have_content("Mika Kalathil")
    end
  end




  describe 'contact' do

    before { visit contact_path }

    it 'contains Email' do
      should have_link('Email', href: 'mailto:me@mikakalathil.ca')
    end

    it 'contains Facebook' do
      should have_link('Facebook', href: 'https://www.facebook.com/mika.kalathil')
    end

    it 'contains LinkedIn' do
      should have_link('LinkedIn', href: 'http://ca.linkedin.com/in/mikakalathil')
    end

    it 'contains Twitter' do
      should have_link('Twitter', href: 'https://www.twitter.com/MikaKalathil')
    end
  end
end
