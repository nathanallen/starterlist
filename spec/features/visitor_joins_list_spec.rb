require 'spec_helper'
require 'helpers/test_list_helper'

feature 'Visitor joins list' do
  include TestListHelper
  
  scenario 'with valid email' do
    join_list_with 'valid@example.com'

    expect(page).to have_content('add another email')
  end

  scenario 'with invalid email' do
    join_list_with 'invalid_email'

    expect(page).to have_content('invalid email')
  end

  def join_list_with(email)
    visit_test_list_path
    fill_in 'Email', with: email
    click_button 'Join the List!'
  end
end