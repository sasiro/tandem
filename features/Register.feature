Feature: Register to the application

  As a person that wants to a language
  So that I want to use the application
  I want to register

Scenario: Register a valid User with just tandem now
    Given I am on the Tandem Spot home page
    When I follow "Sign up"
    And I fill in "Name" with "Ridley"
    When I fill in the "Surname" with "Donet"
    When I fill in the "Email" with "victordp86@gmail.com"
    When I select "Spain" from country
    When I fill in the "Password" with "12alalala98"
    When I fill in the "Password confirmation" with "12alalala98"
    When I select "just chat now"
    When I select "Spanish" from languages you speak
    And I select "English from "languages you want to improve"
    And I select "Technology" from "Interests"
    And I press "Sign up"
    Then I should see "Tandem Now"
