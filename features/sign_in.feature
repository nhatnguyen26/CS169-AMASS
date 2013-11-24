Feature: sign in to AMASS account for registered filmmakers

	As a registered filmmaker
	So that I can access my profile or join new projects
	I want to sign in/out to my account

Background: filmmakers have signed up for AMASS accounts

	Given the following filmmakers exist:
	| name	 | username	| password    |      email       |
	| Jackie | abc123 	| rst456789   | abc123@gmail.com |
	| Tom	 | xyz789	| ghi246810   | xyz789@gmail.com |

Scenario: view sign in form
	Given I am on the home page
	When I follow "Login"
	Then I should be on the sign in page
	And I should see "Username"
	And I should see "Password" 
	And I should see "Login" 

Scenario: sign in with a username
	Given I am logged in as "abc123" with password "rst456789"
	Then I should be on the home page
	And I should see "Hi Jackie"

Scenario: sign in with wrong password
	Given I am logged in as "abc123" with password "r456"
	And I should see "Invalid username/password combination"

Scenario: sign in with non-existing account
	Given I am logged in as "mno123" with password "req456"
	Then I should see "Invalid username/password combination"
