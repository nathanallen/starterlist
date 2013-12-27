When(/^I visit the homepage$/) do
  visit '/'
end

When(/^I fill in the list creation form$/) do
  fill_in 'Email', with: "email@email.com"
  fill_in 'List Name', with: "static"
  click_button 'Start Your List!' || 'Submit'
end

Then(/^I see my list name in the title$/) do
  page.should have_content 'custom' #this should reflect url
end

When(/^I visit a custom url$/) do
  visit '/custom'
end

Then(/^I see confirmation$/) do
  page.should have_content 'success'
end

When(/^I fill in the signup form$/) do
  fill_in 'Email', with: "email@email.com"
end

When(/^I click submit$/) do
  click_button 'Start Your List!' || 'Submit'
end
