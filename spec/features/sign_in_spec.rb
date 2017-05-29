require 'rails_helper'

  feature 'user sign up' do

    scenario 'user signs up with valid information' do
      visit root_path
      click_link 'Sign Up'
      fill_in 'First name', with: 'Guy'
      fill_in 'Last name', with: 'Guyerson'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign Up'

      expect(page).to have_content('Account Created!')
      expect(page).to have_content('Sign Out')
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
