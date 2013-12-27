Given(/^a list name that already exists$/) do
  @list_name = List.last.url
end

Given(/^a bad list name$/) do
  @list_name = "?illegal-url!"
end

Given(/^a bad email$/) do
  @email = "bad.email@tset"
end

Given(/^the current number of lists$/) do
  @total_lists = List.all.count
end

When(/^I visit the homepage$/) do
  visit '/'
end

When(/^I visit the custom url$/) do
  visit "/" + @list_name || List.last.url
end

When(/^I visit a bad custom url$/) do
  visit '/?illegal-custom-url!'
end

When(/^I fill in the list creation form$/) do
  fill_in 'Email', with: @email || "email@email.com"
  fill_in 'List Name', with: @list_name || "static"
  click_button 'Start Your List!' || 'Submit'
end

When(/^I fill in the signup form$/) do
  fill_in 'Email', with: "email@email.com"
end

When(/^I click submit$/) do
  click_button 'Start Your List!' || 'Submit'
end

Then(/^I see my list name in the title$/) do
  page.should have_content 'custom' #this should reflect url
end

Then(/^I see confirmation$/) do
  page.should have_content 'success'
end

Then(/^I see an error message$/) do
  page.should have_content 'error'
end

Then(/^the number of lists has increased by one$/) do
  List.all.count.should eq(@total_lists+1)
end

Then(/^I can sign up a friend$/) do
  # step(/^I fill in the signup form$/)
end
