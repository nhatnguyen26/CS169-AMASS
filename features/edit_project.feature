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
      | org A | org A 	| rst456789   | abc123@gmail.com | nonprofit |
      | org B | org B   | asdf12345	      | org@gmail.com | nonprofit |
    Given I am logged in as "org A" with password "rst456789"
    Then I should be on the home page
    And I should see "Hi org A"

  Scenario: Go to edit page as nonprofit
    When I follow "Hi org A"
    And I should see "My Projects"
    When I follow "My Projects"
    Then I should be on the my projects page
    And I should see "Project A"
    And I should see "Project B"
    And I should not see "Project C"
    
  Scenario: Edit the project blurb as nonprofit
    Given I am on the my projects page
    When I follow "Project A"
    Then I should be on the project page for "Project A"
    And I should see "Project A"
    And I should see "sample blurb"
    And I should see "Edit Project"
    When I follow "Edit Project"
    Then I should be on the edit project page for "Project A"
    Then I should see "edit"
    When I follow "edit"
    And I should see "sample blurb"
    And I fill in "blurb" with "Lisa and Phoebe are cool"
    And I press "Save"
    Then I should see "Lisa and Phoebe are cool"
    And I should not see "Sample blurb"
 
  Scenario: Edit the project name as nonprofit
    Given I am on the my projects page
    When I follow "Project A"
    Then I should be on the project page for "Project A"
    And I should see "Project A"
    When I follow "Edit Project"
    And I fill in "name" with "Project D"
    And I press "Save"
    Then I should see "Project D"
    And I should not see "Project A"
    
  Scenario: Cancel an edit to project mission as nonprofit
    Given I am on the edit project page for "Project A"
    When I follow "edit_mission"
    And I fill in "mission_input" with "this mission is cool"
    And I press "Cancel"
    Then I should see "Sample Mission"
    And I should not see "this mission is cool"

  Scenario: Cannot edit project if not correct nonprofit
    Given I am on the project page for "Project C"
    And I should not see "Edit Project"
    
  Scenario: Cannot access edit page if not correct nonprofit
    When I am on the edit project page for "Project C"
    Then I should be on the home page
    And I should see "You are not authorized to edit this project"