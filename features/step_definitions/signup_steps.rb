Given(/^I do not fill in "(.*?)"$/) do |field|
  assert field.blank? != true
end

