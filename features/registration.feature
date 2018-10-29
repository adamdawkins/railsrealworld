Feature: Registration

  As a blogger
  I want to create an account
  So that I can use the Medium clone


  Scenario: Successful registration
    Given I do not have an account 
    When I create an account with username "adamdawkins", email "adam@dragondrop.uk", and password "password"
    Then I have an account
