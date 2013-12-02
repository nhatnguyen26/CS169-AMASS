Given /the following admins exist/ do |table|
  table.hashes.each do |admin|
    AdminUser.create! admin
  end
end

Given /I am logged in with email "(.*?)" and password "(.*?)"$/ do |username, password|
  visit '/admin/login'
  fill_in 'admin_user_username', :with => username
  fill_in 'admin_user_password', :with => password
  click_button 'Login'
end

Given /I am signed out/ do
  visit 'admin/logout'
end

When /I visit the edit page/ do
  visit 'admin_users/2/edit'
end

When /I visit the view page/ do
  visit 'admin_users/2'
end

When /^I am signed in$/ do
  user = Factory(:user)
  login_as user
end

When /^I am signed in as an admin$/ do
  user = Factory(:user, :admin => true)
  login_as user
end
