require 'rails_helper'

feature 'user reviews a comic' do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
  end

  scenario 'user successfully adds a review' do
    user = FactoryGirl.create(:user)
    comic = FactoryGirl.create(:comic, user_id: user.id)
    genre = FactoryGirl.create(:genre)
    login_as(user,:scope => :user)
    visit '/comics/new'
    fill_in 'Title', with: "Stuff"
    fill_in 'Artist', with: comic.artist
    fill_in 'Author', with: comic.author
    fill_in 'Description', with: comic.description
    click_button 'Add Comic'
    click_link 'Comics'
    click_link comic.title
    fill_in 'Rating', with: 5
    fill_in 'Review', with: 'This is content'
    click_button 'Add Review'
    expect(page).to have_content('Review Added!')

    expect(page.current_url).to eq("http://www.example.com/comics/#{comic.id}")
  end

  scenario 'user unsuccessfully adds a review' do
    user = FactoryGirl.create(:user)
    comic = FactoryGirl.create(:comic, user_id: user.id)
    genre = FactoryGirl.create(:genre)
    login_as(user,:scope => :user)
    visit '/comics/new'
    fill_in 'Title', with: "Stuff"
    fill_in 'Artist', with: comic.artist
    fill_in 'Author', with: comic.author
    fill_in 'Description', with: comic.description
    click_button 'Add Comic'
    click_link 'Comics'
    click_link comic.title
    fill_in 'Rating', with: "Tacos"
    fill_in 'Review', with: ''
    click_button 'Add Review'
    expect(page).to have_content('Rating is not a number')
    expect(page).to have_content("Content can't be blank")
  end

end
