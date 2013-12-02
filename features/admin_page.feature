Feature: Sign in to AMASS admin page
  As an admin of AMASS media
  So that I can manage/ organize the web page
  I want to manage infos about admins, filmmakers, nonprofit, and projects

  Background:
    Given the following admins exist:
	| email	           | password | password_confirmation | 
	| admin1@amass.com | 12345678 | 12345678              |
	| admin2@amass.com | 12345678 | 12345678              |

    Given the following filmmakers exist:
	| name	 | username	| password |      email       | usertype  |
	| Jackie | abc123 	| 12345678 | abc123@gmail.com | Filmmaker |
	| Tom	 | xyz789	| 12345678 | xyz789@gmail.com | Filmmaker |

    Given the following projects exist:
        | name        | category		|location	| organization | blurb               | nonprofit_mission         | description               | deadline               | status        | budget    |
        | Project A   | education	| Alabama	| org A        | sample blurb        | sample mission            | sample description        | 30-Oct-2013            | open          | 2000      |
        | Project B   | housing		| California	| org B        | new blurb           | free mission              | to describe               | 20-Nov-2013            | open          | 5000      |
        | Project C   | community	| California	| org C        | blurb C             | goals for C               | stuffs for C              | 06-Nov-2013            | pending       | 1000      |
        | Project D   | community	| Delaware	| org D        | blurb D        | goals for D            | stuffs for D        | 06-Nov-2013            | pending          | 1000      |
        | Project E   | education	| Florida	| org E        | blurb E           | goals for E              | stuffs for E               | 06-Nov-2013            | pending          | 1000      |
        | Project F   | community	| California	| org F        | blurb F             | goals for F               | stuffs for F              | 06-Nov-2013            | pending       | 1000      |

  Scenario: As a regular user who is signed in, I am redirected to the homepage
    Given I am logged in as "abc123" with password "12345678"
    Then I should be on the home page
    And I should see "Hi Jackie"

 Scenario: As an admin user, I try to login with incorrect password
    Given I am on the admin page
    When I am logged in with email "admin1@amass.com" and password "123456789"
    Then I should see "Invalid username/password combination"
    And I should be on the admin page 

  Scenario: As an admin user, I try to login with incorrect email address
    Given I am on the admin page
    When I am logged in with email "admin3@amass.com" and password "12345678"
    Then I should see "Invalid username/password combination"
    And I should be on the admin page

  Scenario: As an admin user, I try to login with correct password
    Given I am on the admin page
    When I am logged in with email "admin1@amass.com" and password "12345678"
    Then I should see "Signed in successfully."
    And I should see "Dashboard"

  Scenario: As an admin user, I try to log out after I logged in
    Given I am logged in with email "admin1@amass.com" and password "12345678"
    And I should see "Dashboard"
    And I am signed out
    Then I should be on the admin page
    Then I should see "You need to sign in or sign up before continuing."

  Scenario: As an admin user, I want to create another admin user
    Given I am logged in with email "admin1@amass.com" and password "12345678"
    Then I should see "Signed in successfully."
    And I should see "Dashboard"
    When I follow "Admin Users"
    And I should see "New Admin User"
    Then I follow "New Admin User"
    And I should see "Email"
    And I should see "Password"
    And I should see "Password confirmation"
    Then I fill in "admin_user_email" with "admin3@amass.com"
    Then I fill in "admin_user_password" with "12345678"
    Then I fill in "admin_user_password_confirmation" with "12345678"
    Then I press "Create Admin user"
    Then I should see "Admin user was successfully created."

  Scenario: As an admin user, I would like to update email and password
    Given I am logged in with email "admin2@amass.com" and password "12345678"
    Then I should see "Signed in successfully."
    And I should see "Dashboard"
    When I follow "Admin Users"
    And I should see "admin2@amass.com"
    When I visit the edit page
    And I should see "Email"
    And I should see "Password"
    And I should see "Password confirmation"
    Then I fill in "admin_user_email" with "admin11@amass.com"
    Then I fill in "admin_user_password" with "123456789"
    Then I fill in "admin_user_password_confirmation" with "123456789"
    Then I press "Update Admin user"
    Then I should see "You need to sign in or sign up before continuing."

  Scenario: As an admin user, I would like to update email and password
    Given I am logged in with email "admin1@amass.com" and password "12345678"
    Then I should see "Signed in successfully."
    And I should see "Dashboard"
    When I follow "Admin Users"
    And I should see "admin1@amass.com"
    When I visit the edit page
    And I should see "Email"
    And I should see "Password"
    And I should see "Password confirmation"
    Then I fill in "admin_user_email" with "admin11@amass.com"
    Then I fill in "admin_user_password" with "123456789"
    Then I fill in "admin_user_password_confirmation" with "123456789"
    Then I press "Update Admin user"
    Then I should see "Admin user was successfully updated."
    Then I should see "admin11@amass.com"

  Scenario: As an admin user, I would like to delete the other account
    Given I am logged in with email "admin1@amass.com" and password "12345678"
    Then I should see "Signed in successfully."
    And I should see "Dashboard"
    When I follow "Admin Users"
    And I should see "admin1@amass.com"
    And I should see "admin2@amass.com"
    When I visit the view page
    Then I should see "Delete Admin User"
    Then I follow "Delete Admin User"
    Then I should see "Admin user was successfully destroyed." 
    And I should not see "admin2@amass.com"

  Scenario: As an admin user, I want to see recently created projects
    Given I am logged in with email "admin1@amass.com" and password "12345678"
    And I should see "Dashboard"
    And I should see "Recent Projects"
    And I should see "Project A"
    And I should see "Project B"
    And I should see "Project C"
    And I should not see "Project D"
    And I should not see "Project E"
    And I should not see "Project F"






