#encoding: utf-8
Feature: List creation form on homepage

Scenario: I can see the list form on the homepage
  When I visit the homepage
  Then I see a list creation form
  And a list submission button

Scenario: I can create a new list
  When I visit the homepage
  And I fill in the list creation form
  Then I see my list name
  And I see an email input field

@selenium
Scenario: I can visit a custom url and see list name in title
  When I visit a custom url
  Then I see my list name in the title