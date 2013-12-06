require 'spec_helper'

describe "Signing Up" do
  subject { page }
  before { visit "/sign_up?usertype=filmmaker" }
  describe "signup page"  do
	it { page.should have_content('Username') }
	it { page.should have_content('Name') }
	it { page.should have_content('Email') }
	it { page.should have_content('Password') }
    it { should have_content('Password Confirmation') }
    #it { should have_content('Are You a Filmmaker or Nonprofit') }     
  end

  describe "with invalid information" do
	 describe "not enter name" do
		before do
			fill_in "Username", with: "mockUser"
			fill_in "Email", with: "mock@gmai.com"
			fill_in "Password", with: "xyz123456"
			fill_in "Password Confirmation", with: "xyz123456"
			#check "Filmmaker"
			click_button "Create an account"
		end
		it { should have_content('Name is required') }
		it { should_not have_content('Email is required') }
		it { should have_content('Username') }
		it { should have_content('Name') }
		it { should have_content('Email') }
		it { should have_content('Password') }
		it { should have_content('Password Confirmation') }
		#it { should have_content('Are You a Filmmaker or Nonprofit') } 
	 end
	 describe "not enter email" do
		before do
			fill_in "Name", with: "mock"
			fill_in "Username", with: "mockUser"
			fill_in "Password", with: "xyz123456"
			fill_in "Password Confirmation", with: "xyz123456"
			#check "Filmmaker"
			click_button "Create an account"
		end
		it { should_not have_content('Name is required') }
		it { should have_content('Email is required') }
		it { should have_content('Username') }
		it { should have_content('Name') }
		it { should have_content('Email') }
		it { should have_content('Password') }
		it { should have_content('Password Confirmation') }
		#it { should have_content('Are You a Filmmaker or Nonprofit') } 
	end
  end 

  describe "with valid information" do
	before do
		fill_in "Name", with: 'mock'
		fill_in "Username", with: "mockUser"
		fill_in "Email", with: "mock@gmail.com"
		fill_in "Password", with: "xyz123456"
		fill_in "Password Confirmation", with: "xyz123456"
		#check "Filmmaker"
		click_button "Create an account"
	end
	it { should have_content 'Hi mock' }
	it { should have_link 'Profile' }
	it { should have_link 'Settings' }
	it { should have_link 'Logout' }
	it { should_not have_link 'Login' }
	it { should_not have_link 'Sign up' }
  end

end
