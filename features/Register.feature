Feature: Register to the application

  As a person that wants to a language
  So that I want to use the application
  I want to register

Background: movies have been added to database

  Given the following interests exist:
  | name     |
  | Technology   |
  | Travel  |

  Given the following languages exist:
  | name     |
  | French   |
  | Spanish  |
  | English  |
  | Portuguese  |

  And I am on the Tandem Spot home page

Scenario: Register a valid User
    When I follow "Sign up"
    And I fill in "Name" with "Ridley"
    When I fill in "Surname" with "Donet"
    When I fill in "Email" with "victordp86@gmail.com"
    When I select "Spain" from "Country"
    When I fill in "Password" with "12alalala98"
    When I fill in "Password confirmation" with "12alalala98"
    And I check "Technology"
    When I select "Spanish" from "Languages you speak"
    And I select "English" from "Languages you want to improve"
    And I press "Sign up"
    Then I should see "Tandem Now"
