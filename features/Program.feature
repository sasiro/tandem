Feature: Program a tandem
  As a registred user
  that wants to practice a language in his free time
  I want to program a tandem with someone

  Background: Some languages,users, etc have been added to the database

    Given the following languages exist:
      | name     |
      | French   |
      | Spanish  |
      | English  |
      | Portuguese  |

    And the following user exist:
      | email | country | password | name | role |
      | jamon@hotmail.com | Spain| 12345678 | Jamon | default |
      | carlos@gmail.com | Spain | 12345678 | Carlos | default |
      | jake@gmail.com | EEUU | 12345678 | Jake | default |

    And the following speaks exist:
      | user_id | language_speak_id |
      | 1  | 1 |
      | 2  | 2 |
      | 3  | 3 |

    And the following improve exist:
      | user_id   | language_improve_id |
      | 1  | 2 |
      | 2  | 1 |
      | 3  | 3 |

 And the following room exist:
      | publisher_id     | available |
      |      | false  |
      |  1   | true   |

 And the following available exist:
      | day     | starts | duration |
      |  monday    | 2000-01-01 16:00:00 UTC  | 2000-01-01 01:00:00 UTC  |
      |  monday    | 2000-01-01 17:00:00 UTC  | 2000-01-01 01:00:00 UTC  |
      |  monday    | 2000-01-01 18:00:00 UTC  | 2000-01-01 01:00:00 UTC  |
      |  tuesday    | 2000-01-01 19:00:00 UTC  | 2000-01-01 01:00:00 UTC  |

   And the following appointment exist:
      | available_id     | user_id |
      | 1  | 1 |
      | 2  | 2 |
      | 3  | 3 |


    And I am on the tandem page

   Scenario: I can add an hour that I'm available
    When I go to the login page
    When I fill in "Email" with "jamon@hotmail.com"
    When I fill in "Password" with "12345678"
    And I press "Login"
    And I follow "Weekly schedule"
    And I select "Monday" from "available_day"
    And I select "09" from "available_starts_4i"
    And I select "00" from "available_starts_5i"
    And I select "01" from "available_duration_4i"
    And I select "00" from "available_duration_5i"
    And I press "Add free time"
    Then I should see "Good. So you can speak languages on Monday"


  Scenario: I can see users(happy path)
    When I go to the login page
    When I fill in "Email" with "jamon@hotmail.com"
    When I fill in "Password" with "12345678"
    And I press "Login"
    And I follow "Weekly schedule"
    And I follow "Continue"
    Then I should see "Name"


   Scenario: I can see users with same languages(happy path)
    When I go to the login page
    When I fill in "Email" with "jamon@hotmail.com"
    When I fill in "Password" with "12345678"
    And I press "Login"
    And I follow "Weekly schedule"
    And I go to users page
    Then I should see "Name"
    Then I should see "Free at"
    Then I should see "monday 05:00 PM"
    Then I should see "Carlos"

   Scenario: I can see users with same languages(sad path)
    When I go to the login page
    When I fill in "Email" with "jamon@hotmail.com"
    When I fill in "Password" with "12345678"
    And I press "Login"
    And I follow "Weekly schedule"
    And I go to users page
    Then I should not see "Jake"


  Scenario: I can sent to a user a request for an appointment(happy path)
  When I go to the login page
    When I fill in "Email" with "jamon@hotmail.com"
    When I fill in "Password" with "12345678"
    And I press "Login"
    And I follow "Weekly schedule"
    And I go to users page
    And I should see "Name"
    And I should see "Carlos"
    Then I should see "monday 05:00 PM"
    And I follow "monday 05:00 PM"
    And I should see "Back"

