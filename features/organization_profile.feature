Feature: Profile page for non-profits
    As a non-profit
    In order for others to find more info about me
    I want to be able to view/edit my profile

    Background: filmmakers are logged in
        Given the following filmmakers exist:
        | name   | username | password |      email       | usertype  |
        | Jackie | abc123   | rst45678   | abc123@gmail.com | filmmaker |

        Given the following non-profits exist:
        | name          | username | password |      email       | usertype   |
        | Organization1 | org1     | 12345678   | org1@example.com | nonprofit |
        | Organization2 | org2     | 45678923   | org2@example.com | nonprofit |


    Scenario: Filmmakers can't edit non-profit's profile
        Given I am logged in as "abc123" with password "rst45678"
        And I am on the profile page of "org1"
        Then I should not see "Edit"

    Scenario: Non-profit can't edit other non-profits' profiles
        Given I am logged in as "org2" with password "45678923"
        And I am on the profile page of "org1"
        Then I should not see "Edit"

    Scenario: Non-profits can render their profiles' edit pages 
        Given I am logged in as "org1" with password "12345678"
        And I am on the profile page of "org1"
        When I follow "Edit"
        Then I should be on the edit page of "org1"

    Scenario: non-owner cannot edit another profile
    	Given I am logged in as "abc123" with password "rst45678"
    	When I am on the edit page of "org1"
		Then I should see "You are not authorized to edit this profile"

    Scenario: non-logged in cannot edit profile
    	Given I am on the edit page of "org1"
		Then I should see "You must log in first"

    Scenario: Organizations can view their profiles
        Given I am logged in as "org1" with password "12345678"
        And I follow "Profile"
        Then I should be on the profile page of "org1"
        And I should see "Organization1"
        And I should see "Edit Profile"
        And I should see "About"
        And I should not see "Contact Form"
        And I should see "Completed Projects"
		And I should see "Active Projects"
        And I should see "Links"
