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
        | name	 | username	| password    	|      email       | usertype  |  id  	  |
        | org A  | org A 	| rst456789   	| abc123@gmail.com | nonprofit |  1	  |
        | org B  | org B   	| asdf12345  	| org@gmail.com    | nonprofit |  2	  |

	Given the following projects exist:
      	| name       | category   |location  | organization | blurb         | nonprofit_mission  | description          | deadline     | status | budget | nonprofit_id |   
      	| Project A  | education  | Alabama  | org A        | sample blurb  | sample mission     | sample description   | 30-Oct-2013  | open   | 2000   |     1        |   
      	| Project B  | community  | Alabama  | org A        | sample blurb  | sample mission     | sample description   | 30-Oct-2013  | open   | 2000   |     1        |
      	| Project C  | community  | Alabama  | org B        | sample blurb  | sample mission     | sample description   | 30-Oct-2013  | open   | 2000   |     2        |

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
	Then I should see "Contact This Filmmaker"
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
	And I should see "user2"

Scenario: check inbox messages
	Given I am logged in as "user2" with password "123456789"
	And "user1" sent a messages to "user2" with topic "Test5" and body "Hello"
	When I follow "My Messages"
	Then I should see "Inbox"
	When I follow "Inbox"
	Then I should see "Test5"
	And I should see "user1"


Scenario: apply for project
        Given I am logged in as "user1" with password "123456789"
        When I go to the projects page
        Then I should see "Project A"
        When I follow "Project A"
        Then I should be on the project page for "Project A"
	Then I should see "Join This Project" button
	When I press "Join This Project"
	Then I should be on the project page for "Project A"
        And I should see "You have successfully applied for this project"
	When I follow "My Messages"
	When I follow "Sentbox"
	Then I should see "Application to join Project A"

Scenario: nonprofit receive application
	Given "user1" applied for "Project A"
	Given I am logged in as "org A" with password "rst456789"
	When I follow "My Messages"
	When I follow "Inbox"
	Then I should see "Application to join Project A"
        

Scenario: view inbox message, go to sender's profile
	Given I am logged in as "user2" with password "123456789"
	And "user1" sent a messages to "user2" with topic "Test5" and body "Hello"
	When I follow "My Messages"
	And I follow "Inbox"
	Then I should see "Test5"
	And I should see "user1"
	When I follow "Test5"
	Then I should see "Hello"
	And I should see "From: user1"
	And I should see "To: user2"
	When I follow "user1"
	Then I should be on the profile page of "user1"

Scenario: view sent message, go to receiver's profile
	Given I am logged in as "user2" with password "123456789"
	And "user2" sent a messages to "user1" with topic "Test5" and body "Hello"
	When I follow "My Messages"
	And I follow "Sentbox"
	Then I should see "Test5"
	And I should see "user1"
	When I follow "Test5"
	Then I should see "Hello"
	And I should see "From: user2"
	And I should see "To: user1"
	When I follow "user1"
	Then I should be on the profile page of "user1"

Scenario: user can put message to trash
	Given I am logged in as "user2" with password "123456789"
	And "user2" sent a messages to "user1" with topic "Test5" and body "Hello"
	When I follow "My Messages"
	And I follow "Sentbox"
	Then I should see "Test5"
	When I follow "Test5"
	Then I should see "Delete" button
	When I press "Delete"
	Then I should be on the message page
	Then I should not see "Test5"
	When I follow "Trash"
	Then I should see "Test5"
	
