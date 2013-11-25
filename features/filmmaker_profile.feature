Feature: Profile page for filmmakers
    As a filmmaker
    In order to impress the non-profits when applying for a project
    I want to be able to view/edit my profile

    Background: filmmakers are logged in
        Given the following filmmakers exist:
        | name   | username | password |      email       | usertype  |
        | Jackie | abc123   | rst45678   | abc123@gmail.com | filmmaker |
        | Tom    | xyz789   | ghi24689   | xyz789@gmail.com | filmmaker |

        Given the following non-profits exist:
        | name          | username | password   |      email       | usertype   |
        | Organization1 | org1     | 12345678   | org1@example.com | nonprofit |

    Scenario: Filmmakers can view their profiles 
        Given I am logged in as "abc123" with password "rst45678"
        And I follow "Profile"
        Then I should be on the profile page of "abc123"
        And I should see "Jackie"
        And I should see "Filmmaker Summary"
        And I should see "About Me"
        And I should see "Experience Summary"
        And I should see "Skills and Expertise"
        And I should see "Links to Work Samples"
        And I should see "Contact Information"
	And I should see "Edit Profile"
        

    Scenario: Filmmakers can't edit other filmmakers' profiles
        Given I am logged in as "xyz789" with password "ghi24689"
        And I am on the profile page of "abc123"
        Then I should not see "Edit"

    Scenario: Non-profit can't edit filmmakers' profiles
        Given I am logged in as "org1" with password "12345678"
        And I am on the profile page of "abc123"
        Then I should not see "Edit"

    Scenario: Filmmakers can render their profiles' edit pages 
        Given I am logged in as "abc123" with password "rst45678"
        And I am on the profile page of "abc123"
        When I follow "Edit"
        Then I should be on the edit page of "abc123"



