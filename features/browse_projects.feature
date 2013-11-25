Feature: browse a list of project
    
    As a film-maker
    So that I can find a project to join
    I want to see all the project available

Background: Project has been added to database
     Given the following projects exist:
        | name        | category		|location	| organization | blurb               | nonprofit_mission         | description               | deadline               | status        | budget    |
        | Project A   | education	| Alabama	| org A        | sample blurb        | sample mission            | sample description        | 30-Oct-2013            | open          | 2000      |
        | Project B   | housing		| California	| org B        | new blurb           | free mission              | to describe               | 20-Nov-2013            | open          | 5000      |
        | Project C   | community	| California	| org C        | blurb C             | goals for C               | stuffs for C              | 06-Nov-2013            | pending       | 1000      |
        | Project D   | community	| Delaware	| org D        | blurb D        | goals for D            | stuffs for D        | 06-Nov-2013            | pending          | 1000      |
        | Project E   | education	| Florida	| org E        | blurb E           | goals for E              | stuffs for E               | 06-Nov-2013            | pending          | 1000      |
        | Project F   | community	| California	| org F        | blurb F             | goals for F               | stuffs for F              | 06-Nov-2013            | pending       | 1000      |
    Given I am on the home page

Scenario: Go to browse project page
        When I follow "Browse Projects"
        Then I am on the projects page
        Then I should see "Project A"
        And I should see "Project B"
        And I should see "Project C"

