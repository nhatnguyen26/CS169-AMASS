Feature: Create a Project

	As a non-profit organization
	So that I can show filmmakers my projects
	I want to create a project

Background: Some non-profit existed in the database
	
	Given the following non-profits exist:
	| name          | username | password   |      email       | usertype   |
	| Organization1 | org1     | 12345678   | org1@example.com | nonprofit  |

        
	Given the following filmmakers exist:
	| name	 | username	| password    |      email       | usertype  |
	| Tom	 | xyz789	| ghi246810   | xyz789@gmail.com | filmmaker |

Scenario: after logging in, non-profit should have option to create a project
	Given I am logged in as "org1" with password "12345678"
    	Then I should see "Hi Organization1"
        When I follow "Hi Organization1"
	Then I should see "Create a Project"
	
Scenario: view create project page
	Given I am logged in as "org1" with password "12345678"
        Then I should see "Hi Organization1"
        When I follow "Hi Organization1"
	Then I should see "Create a Project"
	When I follow "Create a Project"
	Then I should be on the create project page
	Then I should see "Title"
        And I should see "Blurb"
        And I should see "Mission"
	And I should see "Category"
	And I should see "Location"
	And I should see "Description"
	And I should see "Deadline"
	And I should see "Budget"

Scenario: create a project with a non-profit account
	Given I am logged in as "org1" with password "12345678"
	When I follow "Create a Project"
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

Scenario: fail to create a project
	Given I am logged in as "org1" with password "12345678"
	When I follow "Create a Project"
	Then I should be on the create project page
	When I press "Save"
	Then I should be on the create project page
	Then I should see "Something went wrong."

Scenario: filmmaker attempts to create a project
	Given I am logged in as "xyz789" with password "ghi246810"
	When I go to the create project page
	Then I should be on the home page
	Then I should see "Filmmaker cannot create projects"

Scenario: Non signed_in user attempts to create a project
	Given I am on the home page
	When I go to the create project page
	Then I should be on the sign up page
	Then I should see "Please take a moment to sign up or log in first."
