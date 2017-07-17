require 'rails_helper'

feature 'user reviews a comic' do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
  end

  let!(:user){ FactoryGirl.create(:user) }


  scenario 'user successfully adds a review' do
    genre = FactoryGirl.create(:genre)
    comic = FactoryGirl.create(:comic, user_id: user.id)
    login_as(user,:scope => :user)
    visit comic_path(comic)
    fill_in 'Rating', with: 5
    fill_in 'Review', with: 'This book ruled!'
    click_button 'Add Review'

    expect(page).to have_content('Review Added!')
    expect(page.current_url).to eq("http://www.example.com/comics/#{comic.id}")

    DatabaseCleaner.clean
  end

  scenario 'user unsuccessfully adds a review' do
    genre = FactoryGirl.create(:genre)
    comic = FactoryGirl.create(:comic, user_id: user.id)
    login_as(user,:scope => :user)
    visit comic_path(comic)
    fill_in 'Rating', with: "Tacos"
    fill_in 'Review', with: ''
    click_button 'Add Review'
    expect(page).to have_content('Rating is not a number')
    expect(page).to have_content("Content can't be blank")

    DatabaseCleaner.clean
  end

  scenario 'unsigned in user tries to add a review' do
    genre = FactoryGirl.create(:genre)
    comic = FactoryGirl.create(:comic)
    visit comic_path(comic)
    expect(page).to have_content('add a review')

    DatabaseCleaner.clean
  end

end
