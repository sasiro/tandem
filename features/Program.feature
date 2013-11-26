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


    And I am on the tandem page

Scenario: Program a tandem option
  Given a logged in user
  When I go to the login page
  And I press "Login"
  Then I should see "Plan"

