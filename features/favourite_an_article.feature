Feature: Favourite an article
  As a user
  I want to favourite and article
  So that I can see it in my profile
  And so that I can show the author my appreciation

  Scenario: User favourites an article
    Given an article exists with title "The Wealth of Nations"
    And I am logged in
    When I go to the article page
    And I favourite the article
    Then I should see "Article favourited"

    When I go to my profile
    And I click on "Favorited Articles"
    Then I should see "The Wealth of Nations"
