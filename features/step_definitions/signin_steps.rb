Given /^the following filmmakers exist/ do |table|
	table.hashes.each do |user|
		new_user = User.create!(user)
		new_user.profilable = Filmmaker.create!
		new_user.save!
    end
	filmmaker = Filmmaker.all

	location = ["San Francisco", "Alameda,Santa Clara", "Santa Clara,San Mateo", "San Mateo"]
	specialty = ["Crowdfunding Video,Documentary,Event", "Event,Short Film,Nature", "Nature,Flash Animation", "Flash Animation,3D Animation,Stop Motion"]
	i = 0
	filmmaker.each do |x|
	  x.location = location[i]
	  x.specialty = specialty[i]
	  i += 1
	  x.save!
	end
end


Given /^the following non-profits exist/ do |table|
	table.hashes.each do |user|
		new_user = User.create!(user)
		new_user.profilable = Nonprofit.create!
		new_user.save!
    end
end


Given /^I am logged in as "(.*?)" with password "(.*?)"$/ do |user,pass|
	visit new_user_session_path
	fill_in "Username", :with => user
	fill_in "Password", :with => pass
	click_button "Sign In"
end
