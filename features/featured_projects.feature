Feature: a list of projects on homepage
    
    As a film-maker
    So that I can find a featured project to join
    I want to see all the featured project available

Background: Project has been added to database
     Given the following projects exist:
        | name        | category		|location	| organization | blurb               | nonprofit_mission         | description               | deadline               | status        | budget    | featured |
        | Project A   | education	| Alabama	| org A        | sample blurb        | sample mission            | sample description        | 30-Oct-2013            | open          | 2000      | true |
        | Project B   | housing		| California	| org B        | new blurb           | free mission              | to describe               | 20-Nov-2013            | open          | 5000      | false |
        | Project C   | community	| California	| org C        | blurb C             | goals for C               | stuffs for C              | 06-Nov-2013            | pending       | 1000      | false |
        | Project D   | community	| Delaware	| org D        | blurb D        | goals for D            | stuffs for D        | 06-Nov-2013            | pending          | 1000      | false |
        | Project E   | education	| Florida	| org E        | blurb E           | goals for E              | stuffs for E               | 06-Nov-2013            | pending          | 1000      | false |
        | Project F   | community	| California	| org F        | blurb F             | goals for F               | stuffs for F              | 06-Nov-2013            | pending       | 1000      | true |

    Given I am on the home page
        Then I should see "Project A"
        And I should not see "Project B"
        And I should not see "Project C"
	And I should not see "Project D"
	And I should not see "Project E"
	And I should see "Project F"

