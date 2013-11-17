Feature: Filter Projects

    As a non-profit organization
    So that I can find the filmmakers with certain criterion
    I want to filter filmmakers

 Background: Add projects to database

    Given the following filmmakers exist:
    | name  | username	| password    |      email      | usertype  | location      | specialty   | 
    | user1 | user1 	| 123456789   | user1@amass.com | Filmmaker | San Francisco | Documentary |
    | user2 | user2	| 123456789   | user2.amass.com | Filmmaker | Alameda	    | Nature      |
    | user3 | user3 	| 123456789   | user3@amass.com | Filmmaker | San Francisco | Nature      |
    | user4 | user4	| 123456789   | user4.amass.com | Filmmaker | Alameda	    | Documentary |
      
    Given I am on the home page
    When I follow "Browse Fimmakers"
    Then I am on the filmmakers page
    Then I should see "Specialties"
    Then I should see "Region"
    Then I should see "Documentary"
    Then I should see "Type"
    Then I should see "Nature"
    Then I should see "San Francisco"
    Then I should see "Alameda"

    Scenario: Before filter
      Then I should see "user1"
      Then I should see "user2"
      Then I should see "user3"
      Then I should see "user4"

    Scenario: Filter by one option (specialty)
      When I check "Documentary"
      Then I should see "user1"
      Then I should not see "user2"
      Then I should not see "user3"
      Then I should see "user4"

    Scenario: Filter by one option (locatiom)
      When I check "Alameda"
      Then I should not see "user1"
      Then I should see "user2"
      Then I should not see "user3"
      Then I should see "user4"

    Scenario: Filter by two option (1 specialty, 1 location)
      When I check "Documentary"
      Then I check "Alameda"
      Then I should not see "user1"
      Then I should not see "user2"
      Then I should not see "user3"
      Then I should see "user4"

