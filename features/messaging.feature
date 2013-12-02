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

Scenario: view inbox
	Given I am logged in as "user1" with password "123456789"
	When I am on the home page
	Then I should see "Inbox"
	When I follow "Inbox"
	Then I should see "Unread"
	And I should see "Read"
	And I should see "Sent"
	And I should see "Create new message"

Scenario: send message
	Given I am logged in as "user1" with password "123456789"
	When I am on the inbox page
	And I follow "Create new message"
	When I fill in the followings:
		| To    | Subject | Body  |
		| user2 | hello	  | hello |
	Then I should see "Message sent successfully"
	When I follow "Sent"
	Then I should see the message to "user2" with subject "hello" and body "hello"

Scenario: receive message
	Given I am logged in as "user1" with password "123456789"
	And "user2" sent to me a message with subject "hello" and body "hello"
	When I am on the home page
	Then I should see "Inbox (1)"
	When I follow "Inbox (1)"
	I should see "Unread (1)"
	When I follow "Unread (1)"
	Then I should see the message to "user2" with subject "hello" and body "hello"

	
