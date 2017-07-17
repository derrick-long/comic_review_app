require 'rails_helper'

feature 'user signs in' do

  let!(:user){ FactoryGirl.create(:user) }

  scenario 'an existing user specifices a valid email and password' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Sign Out')
  end

  scenario 'a nonexistant email and password is supplied' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'person123@gmail.com'
    fill_in 'Password', with: 'Password'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end

  scenario 'a existing email with the wrong password' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'Junk123'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'an already authenticated user cannot re-sign in' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')
  end

end
