Feature: Logout

  As a security conscious user in an Internet Cafe
  I want to logout
  So that nobody else can post and comment as me

  Scenario: Logout
    Given I am logged in
    When I log out
    Then I should see "You have been logged out"
    And I should see "Login"
