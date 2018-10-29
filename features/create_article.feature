Feature: Create an Article

  As a user
  I want to create an article
  So that people will read what I have to say


  Scenario: Logged in User
    Given I am logged in
    When I create an article with title "This is my article", a description and a body
    Then an article with title "This is my article" should exist

  Scenario: User not logged in
    Given I am not logged in
    When I create an article with title "This is my article", a description and a body
    Then an article with title "This is my article" should not exist

  Scenario: Invalid article
    Given I am logged in
    When I create an article without a title
    Then an article should not be created
    # And I should see an error - save this for the UI
