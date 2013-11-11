require 'spec_helper'

describe "Signing in" do
  subject { page }
  before { 
	visit new_user_session_path 
  }
  describe "signin page" do
	it { should have_content('Sign In') }
	it { should have_content('Remember me') }
	it { should have_content('New user?') }
	it { should have_content('Sign up now!') }
    it { should have_css('input#username') }
    it { should have_css('input#password') }
  end

  describe "sign up if not have account" do
 	before { click_link 'Sign up now!' }

    it { should have_content('Sign Up') }
  end

  describe "with invalid information" do
	describe "not enter username and password" do
    	before { click_button "Sign In" }
		it { should have_content('Sign In') }
		it { should have_content('Remember me') }
		it { should have_content('New user?') }
		it { should have_content('Sign up now!') }
   		it { should have_css('input#username') }
    	it { should have_css('input#password') }
		it { should have_content('Invalid username/password combination') }
	end
	
	describe "enter non-existing username" do 
		before do
			fill_in "Username", with: "XYZ"
			fill_in "Password", with: "xyz123"
			click_button "Sign In"
		end
		it { should have_content('Sign In') }
		it { should have_content('Remember me') }
		it { should have_content('New user?') }
		it { should have_content('Sign up now!') }
    	it { should have_css('input#username') }
    	it { should have_css('input#password') }
		it { should have_content('Invalid username/password combination') }
	end

	describe "enter existing username with wrong password" do
		let(:user) { 
			FactoryGirl.create(:user) 	
		} 
		before do
			fill_in "Username", with: user.username
			fill_in "Password", with: "xyz123"
			click_button "Sign In"
		end
		it { should have_content('Sign In') }
		it { should have_content('Remember me') }
		it { should have_content('New user?') }
		it { should have_content('Sign up now!') }
    	it { should have_css('input#username') }
	    it { should have_css('input#password') }
		it { should have_content('Invalid username/password combination') }
	end
  end

  describe "with valid information" do
	let(:user) { 
		FactoryGirl.create(:user) 
	}
	before do 
		fill_in "Username", with: user.username
		fill_in "Password", with: user.password
		user.profilable = Filmmaker.create!
		user.save!
		click_button "Sign In"
	end
	it { should_not have_link('Sign In') }
	it { should_not have_link('Sign up') }
	it { should have_content('Hi Jane Doe') }
	it { should_not have_css('input#username') }
	it { should_not have_css('input#password') }
	it { should have_link 'Profile' }
	it { should have_link 'Settings' }
	it { should have_link 'Logout' }
	
	describe "followed by signout" do 
		before { click_link "Logout" }
		it { should have_link 'Login' }
		it { should have_link 'Sign Up' }
	end
  end
end
