Feature: join a project

	As a film-maker
    So that I can join a project
    I want to be able to notify the non-profit about my interests

Background: 
     Given the following projects exist:
        | name        | category    |location	 | organization | blurb               | nonprofit_mission         | description               | deadline               | status        | budget    |nonprofit_id|
        | Project A   | education   | Alabama	 | org A        | sample blurb        | sample mission            | sample description        | 30-Oct-2013            | open          | 2000      |1		|
        | Project B   | housing	    | California | org B        | new blurb           | free mission              | to describe               | 20-Nov-2013            | open          | 5000      |2		|

	Given the following filmmakers exist:
    	| name  | username	| password    |      email      | usertype  | 
    	| user1 | user1 	| 123456789   | user1@amass.com | filmmaker |
	| user2 | user2 	| 123456789   | user2@amass.com | filmmaker |

	Given the following non-profits exist:
        | name	 | username	| password    	|      email       | usertype  |  id  |
        | org A  | org A 	| rst456789   	| abc123@gmail.com | nonprofit |  1	  |
        | org B  | org B   	| asdf12345  	| org@gmail.com    | nonprofit |  2	  |

Scenario: view project page 
	Given I am logged in as "user1" with password "123456789"
	When I am on the project page for "Project A"
	Then I should see "Join This Project" button

Scenario: join project
	Given I am logged in as "user1" with password "123456789"
	When I am on the project page for "Project A"
	And I press "Join This Project"
	Then I should be on the project page for "Project A"
	And I should see "You have successfully applied for this project"
	And I should not see "Join This Project"
	And I should see "Applied"

Scenario: non-profit can see the notifications
	Given "user1" applied for "Project A"
	And I am logged in as "org A" with password "rst456789"
	And I am on the home page
	Then I should see "Inbox (1)"
	When I follow "Inbox (1)"
	Then I should see an unread message from "user1"
	When I follow this message
	Then I should see "Accept"
	And I should see "Reject"

Scenario: non-profit can accept the application
	Given "user1" applied for "Project A"
	And I am logged in as "org A" with password "rst456789"
	When I "accept" the application of "user1" for "Project A"
	Then I should see "Notification has been sent to "user1"
	And the status for "Project A" should be "pending"

Scenario: non-profit can reject the application
	Given "user1" applied for "Project A"
	And I am logged in as "org A" with password "rst456789"
	When I "reject" the application of "user1" for "Project A"
	Then I should see "Notification has been sent to "user1"
	And the status for "Project A" should be "open"

Scenario: more than one application
	Given "user1" and "user2" applied for "Project A"
	And I am logged in as "org A" with password "rst456789"
	And I am on the home page 
	Then I should see "Inbox (2)"
	When I "accept" the application of "user1" for "Project A"
	Then the status for "Project A" should be "pending"



	
