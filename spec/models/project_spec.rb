require 'spec_helper'

describe Project do

  before { @project = Project.new(:name => 'Test', :year => 2014, :link => 'http://www.test.ca') }
  subject { @project }

  describe 'Testing response and validity' do
    it { should respond_to(:name) }
   	it { should respond_to(:year) }
    it { should respond_to(:link) }
    it { should be_valid }
  end

  describe 'Testing presence' do

  	describe 'Name is not empty' do
  	  before { @project.name = " " }
      it { should_not be_valid }
    end

    describe 'Name max length should be 24' do
      before { @project.name = "a" * 25}
      it { should_not be_valid }
    end

    describe 'Name is is proper' do
      before { @project.name = '&$@?7nsjsjwbwmk.?' }
      it { should_not be_valid }
    end

    describe 'Name is valid' do
      before { @project.name = "Mika's Website App" }
      it { should be_valid }
    end

    describe 'Name & URL is not taken' do
      before do
               @project_same = @project.dup
               @project_same.save
      end
      it { should_not be_valid }
    end

    describe 'Year is not 0' do
      before { @project.year = 0 }
      it { should_not be_valid }
    end

    describe 'Year is above 2012' do
      before { @project.year = 2012 }
      it { should_not be_valid }
    end

    describe 'Year is less then 2015' do
      before { @project.year = 2015 }
      it { should_not be_valid }
    end

    describe 'Year is valid' do
      before { @project.year = 2014 }
      it { should be_valid }
    end

    describe 'URL is not empty' do
      before { @project.link = ' ' }
      it { should_not be_valid }
    end

    describe 'URL is proper' do
      before { @project.link = 'www.mika'}
      it { should_not be_valid }
    end

    describe 'URL is valid' do
      before { @project.link = 'http://www.google.ca' }
      it { should be_valid }
    end
  end
end
