#encoding: utf-8
Feature: I can create a new list

@selenium
Scenario: I create a new list with a valid email and list name
  Given the current number of lists
  When I visit the homepage
  And I fill in the list creation form
  And I click submit
  Then I see confirmation
  And I see my list name in the title
  And the number of lists has increased by one

@selenium
Scenario: Name has been taken
  Given a list name that already exists
  When I visit the homepage
  And I fill in the list creation form
  And I click submit
  Then I see an error message

@selenium
Scenario: List name has illegal chars
  Given a bad list name
  When I visit the homepage
  And I fill in the list creation form
  And I click submit
  Then I see an error message

@selenium
Scenario: Email is malformed
  Given a bad email
  When I visit the homepage
  And I fill in the list creation form
  And I click submit
  Then I see an error message