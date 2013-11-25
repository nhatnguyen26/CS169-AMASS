Feature: Filter Projects

    As a non-profit organization
    So that I can find the filmmakers with certain criterion
    I want to filter filmmakers

 Background: Add projects to database

    Given the following filmmakers exist:
    | name  | username	| password    |      email      | usertype  | 
    | user1 | user1 	| 123456789   | user1@amass.com | Filmmaker |
    | user2 | user2	| 123456789   | user2@amass.com | Filmmaker | 
    | user3 | user3 	| 123456789   | user3@amass.com | Filmmaker | 
    | user4 | user4	| 123456789   | user4@amass.com | Filmmaker | 
      
    Given I am on the home page
    When I follow "Browse Filmmakers"
    Then I am on the filmmakers page
    Then I should see "Specialties"
    Then I should see "Documentary"
    Then I should see "Event"
    Then I should see "Regions"
    Then I should see "San Francisco"
    Then I should see "Alameda"

    Scenario: Before filter
      Then I should see "user1"
      Then I should see "user2"
      Then I should see "user3"
      Then I should see "user4"

    Scenario: Filter by specialty 1
      When I follow "Event"
      Then I should see "user1"
      Then I should see "user2"
      Then I should not see "user3"
      Then I should not see "user4"

    Scenario: Filter by specialty 2
      When I follow "Stop Motion"
      Then I should not see "user1"
      Then I should not see "user2"
      Then I should not see "user3"
      Then I should see "user4"

    Scenario: Filter by location
      When I follow "San Mateo"
      Then I should not see "user1"
      Then I should not see "user2"
      Then I should see "user3"
      Then I should see "user4"

    Scenario: Filter by location
      When I follow "Alameda"
      Then I should not see "user1"
      Then I should see "user2"
      Then I should not see "user3"
      Then I should not see "user4"

