require 'rails_helper'

RSpec.feature 'User Credentials', type: :feature do
  scenario 'should enter valid name and Sign Up' do
    visit new_user_path
    fill_in :Name, with: 'Amit'
    click_on 'SIGN UP'
    User.create(name: 'Amit')
  end

  scenario 'should enter valid name and login' do
    visit new_session_path
    fill_in :Name, with: 'Amit'
    click_on 'Okay'
  end

  scenario 'should visit the index page and view his name' do
    visit root_path
    expect(page).to have_content 'Amit'
  end

  scenario "can't accept not existing user" do
    visit new_session_path
    fill_in :Name, with: 'xcsfrgthyuyjjd'
    click_on 'Okay'
    expect(page).to have_content 'Please enter valid name'
  end
end
