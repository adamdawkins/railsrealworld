Feature: Login

  As a site member
  I want to login 
  So that I can use my account

  Scenario: Successful login
    Given I have an account with email "adam@dragondrop.uk" and password "P00lcL34n1n5"
    When I login with email "adam@dragondrop.uk" and password "P00lcL34n1n5"
    Then I should see "You have logged in"
    And I should be at "/"
