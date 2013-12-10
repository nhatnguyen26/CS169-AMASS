Feature: Update account settings
  As a non-profit or filmmaker
  In order to update my information
  I want to be able to update my account settings

  Background: filmmaker, non-profit exist
    Given the following filmmakers exist:
      | name    | username | password |      email         | usertype  |
      | oldname | abc123   | rst45678 | oldemail@gmail.com | filmmaker |

    Given the following non-profits exist:
      | name     | username | password |      email         | usertype  |
      | oldorg   | org1     | 12345678 | oldorg@example.com | nonprofit |


  Scenario: filmmaker cannot udpate settings with incorrect username/password combination
    Given I am logged in as "abc123" with password "rst45678"
    Then I should see "Hi oldname"
    When I follow "Settings"
    Then I should be on the settings page
    And I should see "Name: oldname"
    And I should see "Email: oldemail@gmail.com"
    And I should see "Update Contact Information"
    When I follow "Update Contact Information"
    And I fill in "password" with "wrongpassword"
    And I fill in "name" with "newname"
    And I fill in "email" with "newemail@gmail.com"
    And I press "Update Info"
    Then I should be on the settings page
    And I should see "Invalid password"
    And I should see "Name: oldname"
    And I should see "Email: oldemail@gmail.com"
  
  Scenario: filmmaker can update settings with correct username/password combination
    Given I am logged in as "abc123" with password "rst45678"
    Then I should see "Hi oldname"
    When I follow "Settings"
    Then I should be on the settings page
    And I should see "Name: oldname"
    And I should see "Email: oldemail@gmail.com"
    And I should see "Update Contact Information"
    When I follow "Update Contact Information"
    And I fill in "password" with "rst45678"
    And I fill in "name" with "newname"
    And I fill in "email" with "newemail@gmail.com"
    And I press "Update Info"
    Then I should be on the settings page
	And I should see "Successfully updated"
    And I should see "Name: newname"
    And I should see "Email: newemail@gmail.com"
    And I should see "Hi newname"

