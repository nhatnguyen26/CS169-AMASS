Feature: Edit a project

  As a nonprofit
  So that I can make changes to a project I own
  I want to edit the project page

  Background: Add projects to database
    Given the following non-profits exist:
      | name	| username	| password    	|      email       | usertype  |  id	|
      | org A 	| org A 	| rst456789   	| abc123@gmail.com | nonprofit |        1	|
      | org B 	| org B   	| asdf12345	| org@gmail.com    | nonprofit |	2	|
    Given the following projects exist:
      | name        | category	|location	| organization | blurb               | nonprofit_mission         | description               | deadline        | status        | budget | nonprofit_id |   
      | Project A   | education	| Alabama	| org A        | sample blurb        | sample mission            | sample description        | 30-Oct-2013     | open          | 2000   |     1	       |   
      | Project B   | community	| Alabama	| org A        | sample blurb        | sample mission            | sample description        | 30-Oct-2013     | open          | 2000   |     1        |
      | Project C   | community	| Alabama	| org B        | sample blurb        | sample mission            | sample description        | 30-Oct-2013     | open          | 2000   |     2        |
    
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

  Scenario: View edit page as nonprofit
    Given I am on the my projects page
    When I follow "Project A"
    Then I should be on the project page for "Project A"
    And I should see "Project A"
    And I should see "sample blurb"
    And I should see "Edit Project"
    When I follow "Edit Project"
    Then I should be on the edit project page for "Project A"
    Then I should see "edit"
    And I should see "Project A"
    And I should see "education"
    And I should see "Alabama"
    And I should see "org A"
    And I should see "sample blurb"
    And I should see "sample mission"
    And I should see "sample description"
    And I should see "open"
    And I should see "2000"

  Scenario: Cannot edit project if not correct nonprofit
    Given I am on the project page for "Project C"
    And I should not see "Edit Project"
    
  Scenario: Cannot access edit page if not logged in
    Given I am on the home page
    And I follow "Logout"
    When I am on the edit project page for "Project C"
    Then I should see "You are not authorized to edit this project"

  Scenario: Cannot access edit page if not correct nonprofit
    Given I am on the edit project page for "Project C"
    Then I should see "You are not authorized to edit this project"

  @javascript
  Scenario: Should be able to delete own project
    Given I am on the edit project page for "Project A"
    When I press "Delete Project"
    Then I should be on the projects page
    And I should not see "Project A"
    And I should see "Your project has been deleted."
    