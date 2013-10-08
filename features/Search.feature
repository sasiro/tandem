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
      | email | country | password | name |
      | victordp86@gmail.com | Spain | 12345678 | Victor |
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

    And I am on the tandem page

Scenario: The user can see the button Search
  When I go to the login page
  And I fill in the following:
    |Email|jamon@hotmail.com|
    |Password|12345678|
  And I press "Login"
  Then I follow "Program a Tandem"
  Then I should see "Search"

Scenario: The user can see other compatible users
  When I go to the login page
  And I fill in the following:
    |Email|jamon@hotmail.com|
    |Password|12345678|
  And I press "Login"
  Then I follow "Program a Tandem"
  Then I should see "Victor"
  Then I should see "Jamon"
  Then I should not see "Jake"
  Then I should not see "Carlos"

