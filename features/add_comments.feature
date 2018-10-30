Feature: Comments
  
  As a user
  I want to  comment on articles
  Because it's the internet

  Background:
    Given an article exists

  Scenario: Guest tries to comment on article
    Given I am not logged in
    And I am on the article page
    When I comment
    Then I am at "/login"
