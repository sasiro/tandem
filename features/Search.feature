Feature: Search users for planing a tandem
  As a registred user
  that wants to improve his language in long term
  I want to use the option Program a Tandem

  Background: Some languages,users, etc have been added to the database
    Given the following languages exist:
      | name     |
      | French   |
      | Spanish  |
      | English  |
      | Portuguese  |

    And the following user exist:
      | email | country | password | name | role |
      | victordp86@gmail.com | Spain | 12345678 | Victor | admin |
      | jamon@hotmail.com | Spain| 12345678 | Jamon | default |
      | carlos@gmail.com | Spain | 12345678 | Carlos | default |
      | jake@gmail.com | EEUU | 12345678 | Jake | default |

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

Scenario: The user can see the button Search
  When I go to the login page
  And I fill in the following:
    |Email|jamon@hotmail.com|
    |Password|12345678|
  And I press "Login"
  Then I follow "Be a language hero"
  Then I follow "Continue"
  Then I should see "Search"

Scenario: The admin user can see  the availavility of other users
  When I go to the login page
  And I fill in the following:
    |Email|victordp86@gmail.com|
    |Password|12345678|
  And I press "Login"
  Then I follow "Be a language hero"
  Then I follow "Continue"
  Then I should see "Free at"
  Then I should see "Victor"
  Then I should see "Monday"

Scenario: The default user can not see  the availavility of other users
  When I go to the login page
  And I fill in the following:
    |Email|jamon@hotmail.com|
    |Password|12345678|
  And I press "Login"
  Then I follow "Be a language hero"
  Then I follow "Continue"
  Then I should not see "Free at"
  Then I should not see "Monday"
  Then I should see "Victor"

