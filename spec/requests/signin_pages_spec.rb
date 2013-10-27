require 'spec_helper'

describe "Authentication" do
  subject { page }
  before { 
	@user = mock(User, :username => "ABC", :password => "XYZ", :name => "mock", :usertype => "Filmmaker", :email => "mock@gmail.com")
	visit signin_path 
  }
  describe "signin page" do
	it { should have_content('Login') }
	it { should have_content('Remember Me') }
	it { should have_content('New user?') }
	it { should have_content('Sign up now!') }
    it { should have_css('input#session_username') }
    it { should have_css('input#session_password') }
  end

  describe "sign up if not have account" do
 	before { click_link 'Sign up now!' }

    it { should have_content('Sign Up') }
  end

  describe "with invalid information" do
	describe "not enter username and password" do
    	before { click_button "Login" }
		it { should have_content('Login') }
		it { should have_content('Remember Me') }
		it { should have_content('New user?') }
		it { should have_content('Sign up now!') }
   		it { should have_css('input#session_username') }
    	it { should have_css('input#session_password') }
		it { should have_content('Invalid username/password combination') }
	end
	
	describe "enter non-existing username" do 
		before do
			fill_in "Username", with: "XYZ"
			fill_in "Password", with: "xyz123"
			click_button "Login"
		end
		it { should have_content('Login') }
		it { should have_content('Remember Me') }
		it { should have_content('New user?') }
		it { should have_content('Sign up now!') }
    	it { should have_css('input#session_username') }
    	it { should have_css('input#session_password') }
		it { should have_content('Invalid username/password combination') }
	end

	describe "enter existing username with wrong password" do 
		before do
			User.stub!(:find_by_username).with("ABC").and_return(@user)
			@user.stub!(:authenticate).with("xyz123").and_return(false)
			fill_in "Username", with: @user.username
			fill_in "Password", with: "xyz123"
			click_button "Login"
		end
		it { should have_content('Login') }
		it { should have_content('Remember Me') }
		it { should have_content('New user?') }
		it { should have_content('Sign up now!') }
    	it { should have_css('input#session_username') }
	    it { should have_css('input#session_password') }
		it { should have_content('Invalid username/password combination') }
	end
  end

  describe "with valid information" do
	before do 
		User.stub!(:find_by_username).with("ABC").and_return(@user)
		@user.stub!(:authenticate).with("XYZ").and_return(true)
		fill_in "Username", with: @user.username
		fill_in "Password", with: @user.password
		click_button "Login"
	end
	
	it { should_not have_css('input#session_username') }
	it { should_not have_css('input#session_password') }
	
  end
end
