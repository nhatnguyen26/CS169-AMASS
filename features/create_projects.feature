Feature: Create a Project

	As a non-profit organization
	So that I can show filmmakers my projects
	I want to create a project

Background: Some non-profit existed in the database
	
	Given the following non-profits exist:
	| name          | username | password   |      email       | usertype   |
	| Organization1 | org1     | 12345678   | org1@example.com | Non-profit |

Scenario: after logging in, non-profit should have option to create a project
	Given I am logged in as "org1" with password "12345678"
    Then I should see "Hi Jackie"
	And I should see "Create a Project"
	
Scenario: view create project page
	Given I am logged in as "org1" with password "12345678"
	When I follow "Create a Project"
	Then I should be on the create project page
	Then I should see "Project Title"
	And I should see "Category"
	And I should see "Location"
	And I should see "Description"
	And I should see "Deadline"
	And I should see "Status"
	And I should see "Budget"

Scenario: create a project with a non-profit account
	Given I am logged in as "org1" with password "12345678"
	When I follow "Create a Project"
	Then I should be on the create project page
	And I fill in "Project Title" with "Project A"
	And I fill in "Category" with "community"
	And I fill in "Location" with "California"
	And I fill in "Description" with "DescriptionA"
	And I fill in "Deadline" with "30-Nov-2013"
	And I fill in "Status" with "open"
	And I fill in "Budget" with "1000"
	When I press "Create a Project"
	Then I should be on "Project A" page

Scenario: fail to create a project
	Given I am logged in as "org1" with password "12345678"
	When I follow "Create a Project"
	Then I should be on the create project page
	When I press "Create a Project"
	Then I should be on the create a project page
	Then I should see "Failure"
