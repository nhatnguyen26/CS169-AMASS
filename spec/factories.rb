require 'user'

FactoryGirl.define do
  factory :user do
    name "Jane Doe"
    username "janedoe"
    password "12345678"
    usertype "filmmaker"
    email "jane@doe.com"
  end
end

FactoryGirl.define do
  factory :project do
    name "Project 1"
    organization "Nonprofit 1"
    blurb "BLURB FOR THE PROJECT Hella tempor vegan, single-origin coffee cred +1 slow-carb flexitarian gastropub"
    nonprofit_mission "MISSION FOR THE PROJECT Consequat veniam American Apparel duis fashion axe, lo-fi irure laborum culpa. Dolor Terry Richardson stumptown aute fap. Hoodie wayfarers master cleanse, officia mustache bicycle rights lo-fi mumblecore art party hashtag nisi Marfa pop-up 90's. Seitan Blue Bottle cillum slow-carb pour-over yr."
    description "DESCRIPTION FOR THE PROJECT Etsy nulla adipisicing jean shorts. Ennui Pinterest authentic tofu, non distillery drinking vinegar. Nulla incididunt minim, assumenda Pitchfork gentrify officia 3 wolf moon 90's."
    deadline "1-1-14"
    status "Looking for filmmakers"
    budget "$1000"
    category "Education"
    location "Berkeley, CA"
  end
end


