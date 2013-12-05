Given(/^"(.*?)" sent a messages to "(.*?)" with topic "(.*?)" and body "(.*?)"$/) do |sender,recipient, topic, body|
  s = User.find_by_username(sender)
  r = User.find_by_username(recipient)
  s.send_message(r,{:topic => topic, :body => body})
end

