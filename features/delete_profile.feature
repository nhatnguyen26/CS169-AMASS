Feature: Delete account
  As a non-profit or filmmaker
  In order to delete my account
  I want to be able to delete my account

  Background: filmmaker, non-profit, projects exist
    Given the following filmmakers exist:
      | name   | username | password |      email       | usertype  |
      | abc123 | abc123   | rst45678 | abc123@gmail.com | filmmaker |

    Given the following non-profits exist:
      | name   | username | password |      email       | usertype  |
      | org1   | org1     | 12345678 | org1@example.com | nonprofit |
    
    Given I am logged in as "org1" with password "12345678"
    Then I should see "Hi org1"
    When I follow "Create A Project"
    Then I should be on the create project page
    And I fill in "Title" with "Project 10"
    And I fill in "Blurb" with "Blurb Impossible"
    And I fill in "Mission" with "Mission Impossible"
    And I fill in "Description" with "Description Impossible"
    And I select "Education" from "Category"
    And I select "Alameda" from "Location"
    And I fill in "Deadline" with "11/30/2013"
    And I fill in "Budget" with "1000"
    When I press "Save"
    Then I should be on the "Project 10" page
    When I follow "Logout"
    Then I should be on the home page
    And I should not see "Hi org1"

  Scenario: non-logged in user cannot delete account
    Given I am on the home page
    Then I should not see "Login"
    And I should see "Sign Up"
    And I should not see "Settings"

  Scenario: filmmaker cannot delete account with incorrect username/password
    Given I am logged in as "abc123" with password "rst45678"
    And I am on the home page
    Then I should see "Hi abc123"
    And I should see "Settings"
    When I follow "Settings"
    Then I should be on the settings page
    And I should see "Delete my account"
    When I follow "Delete my account"
    Then I should be on the delete confirmation page
    When I fill in "Username" with "abc123"
    And I fill in "Password" with "abc12345"
    And I follow "Delete"
    Then I should be on the delete confirmation page
    And I should see "incorrect username/password combination"
    When I fill in "Username" with "rst234"
    And I fill in "Password" with "rst45678"
    And I follow "Delete"
    Then I should be on the delete confirmation page
    And I should see "incorrect username/password combination"
    When I follow "Browse Filmmakers"
    Then I should be on the filmmakers page
    And I should see "abc123"

  Scenario: filmmaker can delete account with correct username/password
    Given I am logged in as "abc123" with password "rst45678"
    And I am on the home page
    Then I should see "Hi abc123"
    And I should see "Settings"
    When I follow "Settings"
    Then I should be on the settings page
    And I should see "Delete my account"
    When I follow "Delete my account"
    Then I should be on the delete confirmation page
    And I fill in "Password" with "rst45678"
    And I follow "Delete"
    Then I should be on the home page
    And I should not see "Hi abc123"
    When I follow "Browse Filmmakers"
    Then I should be on the filmmakers page
    And I should not see "abc123"

  Scenario: nonprofit cannot delete account with incorrect username/password
    Given I am logged in as "org1" with password "12345678"
    And I am on the home page
    Then I should see "Hi org1"
    And I should see "Settings"
    When I follow "Settings"
    Then I should be on the settings page    And I should see "Delete my account"
    When I follow "Delete my account"
    Then I should be on the delete confirmation page
    When I fill in "Username" with "org2"
    And I fill in "Password" with "12345678"
    And I follow "Delete"
    Then I should be on the delete confirmation page
    And I should see "incorrect username/password combination"
    When I fill in "Username" with "org1"
    And I fill in "Password" with "rst45678"
    And I follow "Delete"
    Then I should be on the delete confirmation page
    And I should see "incorrect username/password combination"
    When I follow "Browse Projects"
    Then I should see "Project 10"

  Scenario: nonprofit can delete account with correct username/password
    Given I am logged in as "org1" with password "12345678"
    And I am on the home page
    Then I should see "Hi org1"
    And I should see "Settings"
    When I follow "Settings"
    Then I should be on the settings page
    And I should see "Delete my account"
    When I follow "Delete my account"
    Then I should be on the delete confirmation page
    When I fill in "Username" with "org1"
    And I fill in "Password" with "12345678"
    And I follow "Delete"
    Then I should be on the home page
    And I should not see "Hi org1"
    When I follow "Browse Projects"
    Then I should be on the projects page
    And I should not see "Project 10"
  
