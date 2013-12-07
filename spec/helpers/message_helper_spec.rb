require 'spec_helper'

describe MessageHelper do
  before(:each) {
    @user = FactoryGirl.create(:user, :id => 1, :name => "name", :username => "username")
  }
  describe 'get_proper_name' do
    it 'should return sender if inbox' do
      message = double()
      message.stub(:sent_messageable_id) {1}
      get_proper_name(message, "inbox").should == "username"
    end

    it 'should return receiver if sent' do
      message = double()
      message.stub(:received_messageable_id) {1}
      get_proper_name(message, "sent").should == "username"
    end

    it 'should return "user no longer active" if nonexistent' do
      message = double()
      message.stub(:received_messageable_id) {2}
      get_proper_name(message, "sent").should == "user no longer active"
    end
  end

  describe 'get_to_username' do
    it 'should return receiver' do
      message = double()
      message.stub(:received_messageable_id) {1}
      get_to_username(message).should == "username"
    end

    it 'should return "user no longer active" if nonexistent' do
      message = double()
      message.stub(:received_messageable_id) {2}
      get_to_username(message).should == "user no longer active"
    end
  end

  describe 'get_to_username' do
    it 'should return receiver' do
      message = double()
      message.stub(:received_messageable_id) {1}
      get_to_username(message).should == "username"
    end

    it 'should return "user no longer active" if nonexistent' do
      message = double()
      message.stub(:received_messageable_id) {2}
      get_to_username(message).should == "user no longer active"
    end
  end

  describe 'get_profile' do
    it 'should return "user no longer active" for sender' do
      message = double()
      message.stub(:sent_messageable_id) {2}
      get_profile(message, 'sender').should == "user no longer active"
    end

    it 'should return "user no longer active" for receiver' do
      message = double()
      message.stub(:received_messageable_id) {2}
      get_profile(message, 'receiver').should == "user no longer active"
    end
  end

end
