require 'spec_helper'
require 'helpers/test_list_helper'

feature 'Visitor visits site' do
  include TestListHelper
  
  @javascript
  scenario 'with valid custom url' do #, :js => true, :driver => :selenium do
    visit_test_list_path
    # sleep 2
    # page.should have_content('Join the List!')
    # expect(page).to have_content('Join the List!')
    #find('h1').should have_content('Join the List!')
    # last_response.body.should have_content('Join the List!')
  end

  @javascript
  scenario 'with invalid custom url' do
    visit_list_path("fakelist!")

    expect(page).to have_content('not found')
  end
end