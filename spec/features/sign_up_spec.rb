require 'rails_helper'

  feature 'user sign up' do

    let!(:user) { FactoryGirl.create(:user) }

    scenario 'user signs up with valid information' do
      visit root_path
      click_link 'Sign Up'
      fill_in 'First name', with: user.first_name
      fill_in 'Last name', with: user.last_name
      fill_in 'Email', with: "TheGuy123@gmail.com"
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_button 'Sign Up'
      user.confirm

      expect(page).to have_content('A message with a confirmation')
      expect(page).to have_content('Sign In')
    end

    scenario 'user signs up with invalid information' do
      visit root_path
      click_link 'Sign Up'
      click_button 'Sign Up'

      expect(page).to have_content("can't be blank")
      expect(page).to have_content('errors')

    end

    scenario 'password confirmation does not match password' do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'notpassword'
      click_button 'Sign Up'

      expect(page).to have_content("doesn't match")
    end
end
