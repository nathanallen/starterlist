When(/^I visit the homepage$/) do
  visit '/'
end

Then(/^I see a list creation form$/) do
  # step(/^I see an email input field$/)
  page.should have_selector 'input'
  page.should have_content 'Email'
  # step(/^I see a custom url input field$/)
  page.should have_selector 'input'
  page.should have_content 'List Name'
  # button
  page.should have_content 'Start Your List!'
  page.should have_selector 'button'
end

Then(/^a list submission button$/) do
  page.should have_content 'Start Your List'
end

When(/^I fill in the list creation form$/) do
  fill_in 'Email', with: "email@email.com"
  fill_in 'List Name', with: "static"
  click_button 'Start Your List!'
end

Then(/^I see my list name$/) do
  page.should have_selector 'h1'
  page.should have_content 'static'
end

Then(/^I see an email input field$/) do
  page.should have_selector 'input'
  page.should have_content 'Email'
end

# Then(/^I see a custom url input field$/) do
#   page.should have_selector 'input'
#   page.should have_content 'Custom link'
# end

When(/^I visit a custom url$/) do
  visit '/custom'
end

Then(/^I see my list name in the title$/) do
  page.should have_content 'custom'
end
