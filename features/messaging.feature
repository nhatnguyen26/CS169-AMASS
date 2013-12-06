Feature: messaging
	As a non-profit/filmmaker
	So that I can communicate with others
	I want to be able to send/receive messages
Background: 
	Given the following filmmakers exist:
    	| name  | username	| password    |      email      | usertype  | 
    	| user1 | user1 	| 123456789   | user1@amass.com | filmmaker |
	| user2 | user2 	| 123456789   | user2@amass.com | filmmaker |

	Given the following non-profits exist:
        | name	 | username	| password    	|      email       | usertype  |  id  |
        | org A  | org A 	| rst456789   	| abc123@gmail.com | nonprofit |  1	  |
        | org B  | org B   	| asdf12345  	| org@gmail.com    | nonprofit |  2	  |

Scenario: view Mailbox
	Given I am logged in as "user1" with password "123456789"
	When I am on the home page
	Then I should see "Hi user1"
	When I follow "Hi user1"
	Then I should see "My Messages"
	When I follow "My Messages"
	Then I should see "Inbox"
	And I should see "Sentbox"

Scenario: send message to a filmmaker
	Given I am logged in as "user1" with password "123456789"
	And I am on the profile page of "user2"
	Then I should see "Contact Form"
	When I fill in "topic" with "Test1"
	When I fill in "body" with "Hello"
	When I press "Send email"
	Then I should be on the profile page of "user2"
	And I should see "Your message to the Filmmaker is successful"

Scenario: check sent messages
	Given I am logged in as "user1" with password "123456789"
	And "user1" sent a messages to "user2" with topic "Test" and body "Hello"
	Then I should see "My Messages"
	When I follow "My Messages"
	Then I should see "Sentbox"
	When I follow "Sentbox"
	Then I should see "Test"

Scenario: check inbox messages
	Given I am logged in as "user2" with password "123456789"
	And "user1" sent a messages to "user2" with topic "Test5" and body "Hello"
	Then I should see "My Messages"
	When I follow "My Messages"
	Then I should see "Inbox"
	When I follow "Inbox"
	Then I should see "Test5"

Scenario: apply for project
        Given I am logged in as "user1" with password "123456789"
        When I go to the projects page
        


	
