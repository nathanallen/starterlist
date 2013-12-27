#encoding: utf-8
Feature: I can sign up for a list that exists

@selenium
Scenario: I can sign up for a list
  Given a list name that already exists
  When I visit the custom url
  And I fill in the signup form
  And I click submit
  Then I see confirmation
  And I can sign up a friend

Scenario: I am redirected if I gave a bad url
  Given a bad list name
  When I visit the custom url
  Then I see an error message