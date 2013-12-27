#encoding: utf-8
Feature: I can create a new list

@selenium
Scenario: I can create a new list
  When I visit the homepage
  And I fill in the list creation form
  And I click submit
  Then I see confirmation
  And I see my list name in the title