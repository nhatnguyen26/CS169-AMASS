Feature: Change password
  As a non-profit or filmmaker
  In order to change my password
  I want to be able to change my password

  Background: filmmaker, non-profit exist
    Given the following filmmakers exist:
      | name   | username | password |      email       | usertype  |
      | abc123 | abc123   | rst45678 | abc123@gmail.com | filmmaker |

    Given the following non-profits exist:
      | name   | username | password |      email       | usertype  |
      | org1   | org1     | 12345678 | org1@example.com | nonprofit |

  Scenario: non-logged in user cannot change password
    Given I am on the home page
    Then I should not see "Login"
    And I should see "Sign Up"
    And I should not see "Settings"

  Scenario: filmmaker cannot change password with incorrect username/password combination
    Given I am logged in as "abc123" with password "rst45678"
    Then I should see "Hi abc123"
    When I follow "Settings"
    Then I should be on the settings page
    And I should see "Change Password"
    When I follow "Change Password"
    Then I should be on the password confirmation page
    When I fill in "Current Username" with "abc123"
    And I fill in "Current Password" with "wrongpassword"
    And I fill in "New Password" with "asdfqwer"
    And I fill in "Confirm New Password" with "asdfqwer"
    And I follow "Change Password"
    Then I should be on the password confirmation page
    And I should see "incorrect username/password combination"
    When I fill in "Username" with "wrongusername"
    And I fill in "Password" with "rst45678"
    And I fill in "New Password" with "asdfqwer"
    And I fill in "Confirm New Password" with "asdfqwer"
    And I follow "Change Password"
    Then I should be on the password confirmation page
    And I should see "incorrect username/password combination"
    And I follow "Logout"
    Then I should not see "Hi abc123"
    Given I am logged in as "abc123" with password "rst45678"
    Then I should see "Hi abc123"

  Scenario: nonprofit cannot change password with incorrect username/password combination
    Given I am logged in as "org1" with password "12345678"
    Then I should see "Hi org1"
    When I follow "Settings"
    Then I should be on the settings page
    And I should see "Change Password"
    When I follow "Change Password"
    Then I should be on the password confirmation page
    When I fill in "Current Username" with "org1"
    And I fill in "Current Password" with "wrongpassword"
    And I fill in "New Password" with "asdfqwer"
    And I fill in "Confirm New Password" with "asdfqwer"
    And I follow "Change Password"
    Then I should be on the password confirmation page
    And I should see "incorrect username/password combination"
    When I fill in "Username" with "wrongusername"
    And I fill in "Password" with "12345678"
    And I fill in "New Password" with "asdfqwer"
    And I fill in "Confirm New Password" with "asdfqwer"
    And I follow "Change Password"
    Then I should be on the password confirmation page
    And I should see "incorrect username/password combination"
    And I follow "Logout"
    Then I should not see "Hi org1"
    Given I am logged in as "org1" with password "12345678"
    Then I should see "Hi org1"
   
  Scenario: filmmaker can change password with correct username/password combination
    Given I am logged in as "abc123" with password "rst45678"
    Then I should see "Hi abc123"
    When I follow "Settings"
    Then I should be on the settings page
    And I should see "Change Password"
    When I follow "Change Password"
    Then I should be on the password confirmation page
    When I fill in "Current Username" with "abc123"
    And I fill in "Current Password" with "rst45678"
    And I fill in "New Password" with "asdfqwer"
    And I fill in "Confirm New Password" with "asdfqwer"
    And I follow "Change Password"
    Then I should be on the home page
    And I should see "Password successfully changed"
    When I follow "Logout"
    Then I should not see "Hi abc123"
    Given I am logged in as "abc123" with password "asdfqwer"
    Then I should be on the home page
    And I should see "Hi abc123"

  Scenario: nonprofit can change password with correct username/password combination
    Given I am logged in as "org1" with password "12345678"
    Then I should see "Hi org1"
    When I follow "Settings"
    Then I should be on the settings page
    And I should see "Change Password"
    When I follow "Change Password"
    Then I should be on the password confirmation page
    When I fill in "Current Username" with "org1"
    And I fill in "Current Password" with "12345678"
    And I fill in "New Password" with "asdfqwer"
    And I fill in "Confirm New Password" with "asdfqwer"
    And I follow "Change Password"
    Then I should be on the home page
    And I should see "Password successfully changed"
    When I follow "Logout"
    Then I should not see "Hi org1"
    Given I am logged in as "org1" with password "asdfqwer"
    Then I should be on the home page
    And I should see "Hi org1"

  Scenario: nonprofit cannot change password to an invalid password
    Given I am logged in as "org1" with password "12345678"
    Then I should see "Hi org1"
    When I follow "Settings"
    Then I should be on the settings page
    And I should see "Change Password"
    When I follow "Change Password"
    Then I should be on the password confirmation page
    When I fill in "Current Username" with "org1"
    And I fill in "Current Password" with "12345678"
    And I fill in "New Password" with "short"
    And I fill in "Confirm New Password" with "short"
    And I follow "Change Password"
    Then I should be on the password confirmation page
    And I should see "password must be at least 8 characters"
    When I fill in "Username" with "org1"
    And I fill in "Password" with "12345678"
    And I fill in "New Password" with "asdfqwer"
    And I fill in "Confirm New Password" with "doesntmatch"
    And I follow "Change Password"
    Then I should be on the password confirmation page
    And I should see "Password doesn't match confirmation"
    And I follow "Logout"
    Then I should not see "Hi org1"
    Given I am logged in as "org1" with password "12345678"
    Then I should see "Hi org1"