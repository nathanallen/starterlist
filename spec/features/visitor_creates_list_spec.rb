require 'spec_helper'

feature 'Visitor creates list' do
  scenario 'input fields exist on home page' do
    visit root_path

    expect(page).to have_selector('input')
    expect(page).to have_content('Email')
    expect(page).to have_content('Custom link')
    expect(page).to have_content('Start Your List!')
  end

  scenario 'with valid email and url' do
    create_list_with 'valid@example.com', 'url'

    expect(page).to have_content('add another email')
  end

  scenario 'with invalid email' do
    create_list_with 'invalid_email', 'url'

    expect(page).to have_content('invalid email')
  end

  scenario 'with invalid url' do
    create_list_with 'valid@example.com', ''

    expect(page).to have_content('not available')
  end

  def create_list_with(email, url)
    visit root_path
    fill_in 'Email', with: email
    fill_in 'List Name', with: Url
    click_button 'Start Your List!'
  end
end