Feature: View Learn More page
  As a user or non-user
  In order to learn more about AMASS Media
  I want to be able to view the Learn More page

  Background: filmmaker and non-profit profiles exist
    Given the following filmmakers exist:
    | name   | username | password |      email       | usertype  |
    | Jackie | abc123   | rst45678 | abc123@gmail.com | filmmaker |

    Given the following non-profits exist:
    | name   | username | password |      email       | usertype  |
    | Org1   | org1     | 12345678 | org1@example.com | nonprofit |

  Scenario: non-logged in user can view Learn More page
    Given I am on the home page
    Then I should see "Login"
    And I should see "Sign Up"
    Then I should see "Learn More"
    When I follow "Learn More"
    Then I should be on the Learn More page
  
  Scenario: filmmaker can view the Learn More page
    Given I am logged in as "abc123" with password "rst45678"
    Then I should see "Learn More"
    When I follow "Learn More"
    Then I should be on the Learn More page

  Scenario: non-profit can view the Learn More page
   Given I am logged in as "org1" with password "rst45678"
   Then I should see "Learn More"
   When I follow "Learn More"
   Then I should be on the Learn More page