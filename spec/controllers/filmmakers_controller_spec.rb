require 'spec_helper'

describe FilmmakersController do
  before do
    @a = mock(Filmmaker, :name => "user1", :username=> "user1", :usertype=> "filmmaker", :email=>"user1@amass.com",:password=>"12345678", :password_confirmation=>"12345678", :location=>"San Francisco", :specialty=>"Nature")
    @b = mock(Filmmaker, :name => "user2", :username=> "user2", :usertype=>"filmmaker", :email=>"user2@amass.com",:password=>"12345678", :password_confirmation=>"12345678", :location=>"Alameda", :specialty=>"Event")
    Filmmaker.stub!(:find).with("1").and_return(@a)
  end

  describe 'show a filmmaker' do
    it "should call show method in the filmmaker" do
      post :show, {:id => "1"}
      response.should render_template('show')
    end
  end

  describe 'edit a profile' do
    it "should call edit method in the filmmaker" do
      post :edit, {:id => "1"}
    end
  end

=begin
  describe 'update a profile' do
    it "should call update method in the filmmaker" do
      @a.stub!(:update_attributes!).and_return(true)
      post :update, {:id => "1"}, format: "json"
    end
  end
=end

  describe 'filter by all' do
    it 'should call index method in the filmmaker' do
      post :index, {:filter => 'all'}
    end
  end

  describe 'filter by Specialty' do
    it 'should call index method in the filmmaker' do
      post :index, {:filter => 'Specialty', :by => "Nature"}
    end
  end

  describe 'filter by Location' do
    it 'should call index method in the filmmaker' do
      post :index, {:filter => 'Location', :by => "San Francisco"}
    end
  end
end
