Feature: Tandem now with random people
  As a registred user
  that wants to improve his language fast
  I want to use the option tandem now

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
 And the following room exist:
      | publisher_id     | available |
      |      | false  |
      |  1   | true   |


    And I am on the tandem page

Scenario: Practice with tandem now
     Given a valid user
  When I go to the login page
  And I fill in the following:
    |Email|jamon@hotmail.com|
    |Password|12345678|
  And I press "Login"
  Then I should see "Logged in successfully"
  Then I follow "Tandem Now"
  Then I should see "Medallas y trofeos"

Scenario: Practice with tandem now with a room that exist
  Given a valid user
  When I go to the login page
  And I fill in the following:
    |Email|jamon@hotmail.com|
    |Password|12345678|
  And I press "Login"
  Then I should see "Logged in successfully"
  Then I follow "Tandem Now"
  Then I should see "Tandem with Victor"

Scenario: Practice with tandem now creating a new room
  Given a valid user
  When I go to the login page
  And I fill in the following:
    |Email|carlos@gmail.com|
    |Password|12345678|
  And I press "Login"
  Then I should see "Logged in successfully"
  Then I follow "Tandem Now"
  Then I should see "Waiting for Tandem to join"

  Scenario: Room filled with a user is not avaliable again
    Given a valid user
    When I go to the login page
    And I fill in the following:
      |Email|jamon@hotmail.com|
      |Password|12345678|
    And I press "Login"
    And I follow "Tandem Now"
    And I should see "Tandem with Victor"
    And I follow "Logout"
    When I go to the login page
    And I fill in the following:
      |Email|jamon@hotmail.com|
      |Password|12345678|
    And I press "Login"
    Then I follow "Tandem Now"
    Then I should not see "Tandem with Victor"


  Scenario: The room has a counter that works
    Given a valid user
    When I go to the login page
    And I fill in the following:
      |Email|jamon@hotmail.com|
      |Password|12345678|
    And I press "Login"
    Then I follow "Tandem Now"
    And I wait for 1 seconds
    Then I should see "Minutes 1"


