require 'capybara/rspec'
# require_relative '../../app'

feature 'adding a bookmark and title' do
  scenario 'user can add a bookmark and a title' do
    visit('/bookmarks/new')
    fill_in 'url', with: "http://example.org"
    fill_in 'title', with: "Example Title"
    click_button 'Submit'

    expect(page).to have_content "Example Title"
  end
end