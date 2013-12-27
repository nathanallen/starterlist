#encoding: utf-8
Feature: I can sign up for a list

@selenium
Scenario: I can sign up for a list
  When I visit a custom url
  And I fill in the signup form
  And I click submit
  Then I see confirmation