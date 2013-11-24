Feature: sign up page for unregistered user
 
  As an unregistered nonprofit
  So that I can access contents for registered nonprofits
  I want to sign up

Background: user wants to sign up

  Given I am on the home page

Scenario: view sign up page
  When I follow "Sign Up"
  Then I should see "Please select a type"
  And I should see "I'm a filmmaker"
  And I should see "I'm a non-profit organization"
  When I follow "I'm a non-profit organization"
  Then I should be on the sign up page
  And I should see "Username"
  And I should see "Password"
  And I should see "Password Confirmation"
  And I should see "Organization Name"
  And I should see "Email"

Scenario: sign up using sign up page 
  Given I am on the sign up page for nonprofit
  And I fill in "Username" with "janedoe"
  And I fill in "Password" with "12345678"
  And I fill in "Password Confirmation" with "12345678"
  And I fill in "Organization Name" with "Jane Doe"
  And I fill in "Email" with "jane@doe.com"
  When I press "Create an account"
  Then I should be on the home page
  Then I should see "Hi Jane Doe"

Scenario: sign up failure
  Given I am on the sign up page for nonprofit
  And I do not fill in "Username"
  When I press "Create an account"
  Then I should be on the sign up page
  Then I should see "Username is required"

  Given I am on the sign up page for nonprofit
  And I do not fill in "Password"
  When I press "Create an account"
  Then I should be on the sign up page
  Then I should see "Password is required"

  Given I am on the sign up page for nonprofit
  And I do not fill in "Password Confirmation"
  And I fill in "Password" with "123456"
  When I press "Create an account"
  Then I should be on the sign up page
  Then I should see "Password doesn't match confirmation"

  Given I am on the sign up page for nonprofit
  And I do not fill in "Name"
  When I press "Create an account"
  Then I should be on the sign up page
  Then I should see "Name is required"

  Given I am on the sign up page for nonprofit
  And I do not fill in "Email"
  When I press "Create an account"
  Then I should be on the sign up page
  Then I should see "Email is required"

Scenario: password is not the same
  Given I am on the sign up page for nonprofit
  And I fill in "Username" with "janedoe"
  And I fill in "Password" with "123456"
  And I fill in "Password Confirmation" with "123457"
  And I fill in "Organization Name" with "Jane Doe"
  And I fill in "Email" with "jane@doe.com"
  When I press "Create an account"
  Then I should be on the sign up page
  Then I should see "Password doesn't match confirmation"
