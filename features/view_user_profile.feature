Feature: View User Profile

  As a reader
  I want to view a user profile
  So that I can see what other articles a user has written

  Scenario: User has written articles
    Given a user exists with username "@ferrah"
    And the user has written 10 articles
    When I go to the user's profile
    Then I should see 10 articles
    And I should see "@ferrah"
