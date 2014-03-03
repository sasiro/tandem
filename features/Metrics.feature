Feature: Admin wants to know important metrics 
  As an admin
  that wants to know the relevant metrics of the users
  I want a panel to see all the relevants metrics

  Background: Some languages, users, etc have been added to the database
      
    Given the following languages exist:
      | name     |
      | French   |
      | Spanish  |
      | English  |
      | Portuguese  |

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

    And the following user exist:
      | email | country | password | name | role | language_improve_ids | language_speak_ids | 
      | victordp86@gmail.com | Spain | 12345678 | Victor | admin | 1 | 1 |
      | jamon@hotmail.com | Spain| 12345678 | Jamon | default | 2|  3|
      | carlos@gmail.com | Spain | 12345678 | Carlos | default | 3 | 4|
      | jake@gmail.com | EEUU | 12345678 | Jake | default | 4 | 2 | 



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


    Scenario: The admin can see the metric total users
    When I go to the login page
    Given I am logged in as "victordp86@gmail.com" with password "12345678"
    And I go to metrics page
    Then I should see "Total users:4"

    