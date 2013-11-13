Feature: Edit a project

  As a nonprofit
  So that I can make changes to a project I own
  I want to edit the project page

  Background: Add projects to database
    Given the following projects exist:
      | name        | category		|location	| organization | blurb               | nonprofit_mission         | description               | deadline               | status        | budget    |
      | Project A   | education	| Alabama	| org A        | sample blurb        | sample mission            | sample description        | 30-Oct-2013            | open          | 2000      |
      | Project B   | community	| Alabama	| org A        | sample blurb        | sample mission            | sample description        | 30-Oct-2013            | open          | 2000      |
      | Project C   | community	| Alabama	| org B        | sample blurb        | sample mission            | sample description        | 30-Oct-2013            | open          | 2000      |
    Given the following non-profits exist:
      | name	 | username	| password    |      email       | usertype  |
      | org A | abc123 	| rst456789   | abc123@gmail.com | Nonprofit |
    Given I am logged in as "abc123" with password "rst456789"
    Then I should be on the home page
    And I should see "Hi org A"

  Scenario: Go to edit page as nonprofit
    And I should see "My Projects"
    When I follow "My Projects"
    Then I should be on the my projects page
    And I should see "Project A"
    And I should see "Project B"
    And I should not see "Project C"
    
  Scenario: Edit the project blurb as nonprofit
    Given I am on the my projects page
    When I follow "Project A"
    Then I should be on the edit project page for "Project A"
    And I should see "Project A"
    And I should see "Sample blurb"
    When I follow "edit_blurb"
    And I fill in "blurb_input" with "Lisa and Phoebe are cool"
    And I press "Save"
    Then I should see "Lisa and Phoebe are cool"
    And I should not see "Sample blurb"
 
  Scenario: Edit the project name as nonprofit
    Given I am on the my projects page
    When I follow "Project A"
    Then I should be on the edit project page for "Project A"
    And I should see "Project A"
    When I follow "edit_name"
    And I fill in "name_input" with "Project D"
    And I press "Save"
    Then I should see "Project D"
    And I should not see "Project D"
    
  Scenario: Cancel an edit to project mission as nonprofit
    Given I am on the edit project page for "Project A"
    When I follow "edit_mission"
    And I fill in "mission_input" with "this mission is cool"
    And I press "Cancel"
    Then I should see "Sample Mission"
    And I should not see "this mission is cool"