require 'rails_helper'

RSpec.feature 'Events', type: :feature do
  scenario 'should find Upcoming Events section' do
    visit root_path
    expect(page).to have_content 'Upcoming Events'
  end

  scenario 'should find Previous Events section' do
    visit root_path
    expect(page).to have_content 'Previous Events'
  end

  scenario 'Able to sign in if user is not logged in' do
    visit root_path
    click_on 'Log In to Create Events'
    visit new_session_path
    fill_in :Name, with: 'Amit'
    click_on 'Okay'
  end

  scenario 'should create a new event' do
    visit new_event_path
    expect(page).to have_content 'Create New Event'
    fill_in :Title, with: 'My First Event'
    fill_in :Description, with: 'All the peoples are invited to party!!!'
    fill_in 'Event Date', with: '11/03/2021'
  end
end
