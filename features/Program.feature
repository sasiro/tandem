Feature: Program a tandem
  As a registred user
  that wants to practice a language in his free time
  I want to select a time to tandem

  Background: Some languages,users, etc have been added to the database

    Given the following languages exist:
      | name     |
      | French   |
      | Spanish  |
      | English  |
      | Portuguese  |

    And the following user exist:
      | email | country | password | name |
      | jamon@hotmail.com | Spain| 12345678 | Jamon |
      | carlos@gmail.com | Spain | 12345678 | Carlos |
      | jake@gmail.com | EEUU | 12345678 | Jake |

    And the following speaks exist:
      | language_speak_id  | user_id |
      | 1  | 2 |
      | 2  | 1 |
      | 3  | 1 |
      | 4  | 1 |
      | 4  | 3 |

    And the following improve exist:
      | language_improve_id     | user_id |
      | 1  | 1 |
      | 2  | 2 |
      | 3  | 2 |
      | 4  | 2 |
      | 1  | 3 |
 And the following room exist:
      | publisher_id     | available |
      |      | false  |
      |  1   | true   |

 And the following available exist:
      | day     | starts | duration |
      |  Monday    | 2000-01-01 16:00:00 UTC  | 2000-01-01 01:00:00 UTC  |
      |  Monday    | 2000-01-01 17:00:00 UTC  | 2000-01-01 01:00:00 UTC  |
      |  Monday    | 2000-01-01 18:00:00 UTC  | 2000-01-01 01:00:00 UTC  |
      |  Tuesday    | 2000-01-01 19:00:00 UTC  | 2000-01-01 01:00:00 UTC  |

   And the following appointment exist:
      | available_id     | user_id |
      | 1  | 1 |
      | 2  | 1 |
      | 3  | 1 |
      | 4  | 1 |
      | 1  | 3 |
      | 2  | 3 |
      | 3  | 3 |
      | 4  | 3 |


    And I am on the tandem page

  Scenario: I add an hour that I'm available
    When I go to the login page
    When I fill in "Email" with "jamon@hotmail.com"
    When I fill in "Password" with "12345678"
    And I press "Login"
    And I follow "Be a language hero"
    And I select "Tuesday 07:00PM-08:00PM" from "Hour (GMT+1)"
    And I press "Add hour"
    Then I should see "Good. So you can speak languages"

  Scenario: I can see users
    When I go to the login page
    When I fill in "Email" with "jamon@hotmail.com"
    When I fill in "Password" with "12345678"
    And I press "Login"
    And I follow "Be a language hero"
    And I select "Tuesday 07:00PM-08:00PM" from "Hour (GMT+1)"
    And I press "Add hour"
    And I follow "Add other one"
    And I follow "Continue"
    Then I should see "Name"
    Then I should see "Carlos"

  Scenario: I can see users with same timetable and languages
    When I go to the login page
    When I fill in "Email" with "jamon@hotmail.com"
    When I fill in "Password" with "12345678"
    And I press "Login"
    And I follow "Be a language hero"
    And I follow "Continue"
    Then I should see "Name"
    Then I should see "Jake"
