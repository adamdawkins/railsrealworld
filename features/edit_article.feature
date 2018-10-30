Feature: Edit Article

  As an author
  I want to edit an article
  To change it's content

  Scenario: Author edits article
    Given I have an account
    And I have created an article with title "The Wealth of the Nations"
    When I go to edit the article
    And I update the title of the article to "The Poverty of Britain"
    Then I should see "The Poverty of Britain"
    And I should see "Article updated"

  Scenario: A guest tries to edit article
  Scenario: A different user tries to edit article
