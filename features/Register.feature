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

 And the following user exist:
      | email | country | password | name |
      | jamon@hotmail.com | Spain| 12345678 | Jamon |

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
    Then I should see "Speak Now"



Scenario: Register a invalid User
    When I follow "Sign up"
    And I fill in "Name" with "Ridley"
    When I fill in "Surname" with "Donet"
    When I fill in "Email" with "victordp86@gmail.com"
    When I select "Spain" from "Country"
    When I fill in "Password" with "12alalala98"
    When I fill in "Password confirmation" with ""
    And I check "Technology"
    When I select "Spanish" from "Languages you speak"
    And I select "English" from "Languages you want to improve"
    And I press "Sign up"
    Then I should not see "Tandem Now"


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
    Then I should see "Program a Tandem"



Scenario: Register a invalid User
    When I follow "Sign up"
    And I fill in "Name" with "Ridley"
    When I fill in "Surname" with "Donet"
    When I fill in "Email" with "victordp86@gmail.com"
    When I select "Spain" from "Country"
    When I fill in "Password" with "12alalala98"
    When I fill in "Password confirmation" with ""
    And I check "Technology"
    When I select "Spanish" from "Languages you speak"
    And I select "English" from "Languages you want to improve"
    And I press "Sign up"
    Then I should not see "Program a Tandem"


Scenario: Login a valid User
    When I follow "Login"
    When I fill in "Email" with "jamon@hotmail.com"
    When I fill in "Password" with "12345678"
    And I press "Login"
    Then I should see "Native languages"


Scenario: Login a invalid User
    When I follow "Login"
    When I fill in "Email" with "jamon@hotmail.com"
    When I fill in "Password" with ""
    And I press "Login"
    Then I should not see "Native languages"
