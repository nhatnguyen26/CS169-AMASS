require 'spec_helper'

describe NonprofitsController do
  before do
    @a = mock(Nonprofit, :name => "user1", :username=> "user1", :usertype=> "filmmaker", :email=>"user1@amass.com",:password=>"12345678", :password_confirmation=>"12345678")
    @b = mock(Nonprofit, :name => "user2", :username=> "user2", :usertype=>"filmmaker", :email=>"user2@amass.com",:password=>"12345678", :password_confirmation=>"12345678")
    @c = mock(Project, :name => 'Project C', :location => 'Santa Clara', :category => 'community', :organization => 'org C', :blurb => 'blurb C', :nonprofit_mission => 'goals for C', :description => 'stuffs for C', :deadline => '31-Jan-2014', :status => 'Pending', :budget => '10')
    Nonprofit.stub!(:find).with("1").and_return(@a)
  end

  describe 'edit a profile' do
    it "should call edit method in the nonprofit" do
      post :edit, {:id => "1"}
    end
  end
end
