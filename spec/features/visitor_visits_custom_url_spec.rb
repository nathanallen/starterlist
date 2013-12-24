require 'spec_helper'
require 'helpers/test_list_helper'

feature 'Visitor visits site' do
  include TestListHelper

  scenario 'with valid custom url' do
    visit_test_list_path

    expect(page).to have_content('Join the List!')
  end

  scenario 'with invalid custom url' do
    visit_list_path("fakelist!")

    expect(page).to have_content('not found')
  end
end