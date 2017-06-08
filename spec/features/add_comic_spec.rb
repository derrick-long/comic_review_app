require 'rails_helper'

feature 'user adds a new comic' do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
  end
  scenario 'user adds a comic succesfully' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'Add A New Comic'
    fill_in 'Title', with: "Rad Picture Book"
    fill_in 'Artist', with: "Rad Dude"
    fill_in 'Author', with: "Super Rad Dude"
    fill_in 'Description', with: "A book about rad dudes doing rad stuff."
    select('Fantasy', :from => 'comic_genre_id')
    click_button 'Add Comic'
    expect(page).to have_content('New comic added!')
  end

  scenario 'user adds a comic unsuccesfully' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'Add A New Comic'
    fill_in 'Title', with: " "
    fill_in 'Artist', with: "Rad Dude"
    fill_in 'Author', with: "Super Rad Dude"
    fill_in 'Description', with: "A"
    select('Superhero', :from => 'comic_genre_id')
    click_button 'Add Comic'
    expect(page).to have_content('Please Correct')
    expect(page).to have_content("Title can't be blank")
  end

end
