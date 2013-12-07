Given(/^"(.*?)" sent a messages to "(.*?)" with topic "(.*?)" and body "(.*?)"$/) do |sender,recipient, topic, body|
  s = User.find_by_username(sender)
  r = User.find_by_username(recipient)
  s.send_message(r,{:topic => topic, :body => body})
end

Then /^I should see "([^"]*)" button/ do |name|
  find_button(name).should_not be_nil
end

Given(/^"(.*?)" apply for "(.*?)"$/) do |filmmaker, project|
  s = User.find_by_username(filmmaker)
  p = Project.find_by_name(project)
  n = Nonprofit.find(p.nonprofit_id)
  r = User.find(n.user.id)
  s.send_message(r, {:body => 'I want to join your project', :topic => "Application to join #{project}"})
end


