require 'spec_helper'

describe ProjectsController do

  subject { page }

  describe 'Index' do

    before {  FactoryGirl.create(:project)
              visit projects_path }

    it 'should list Projects' do
      should have_content('This Website')
      should have_content('2014')
      should have_link('GitHub', 'http://www.github.com/Snowfiring/Mika')
    end
  end

  describe 'New' do

    before { Capybara.app_host = "http://admin.domain.com"
              visit new_project_path }

    let(:submit) { "Add Project" }

    describe "has invalid information" do
      it "should not be valid" do
        expect { click_button submit }.not_to change(Project, :count)
      end

      it 'should display invalid info' do
        click_button submit
        should have_content('The form')
      end
    end

    describe "has valid information" do
      before do
        fill_in 'Name',         with: 'Sample App'
        fill_in 'Year',         with: 2014
        fill_in 'Description',  with: "This is a description"
        fill_in 'Link',         with: "http://www.mikakalathil.ca"
      end

      it 'should be valid' do
        expect { click_button submit }.to change(Project, :count).by(1)
      end

      it 'should redirect to index' do
        current_path == projects_path
      end

      it 'should display success' do
        click_button submit
        should have_content('Project added successfully')
      end
    end
  end

  describe 'Destroy' do

  end
end
