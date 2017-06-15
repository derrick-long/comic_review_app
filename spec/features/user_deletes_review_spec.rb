require 'rails_helper'

feature 'delete a review' do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
  end

  scenario "user deletes a review" do
    user = FactoryGirl.create(:user)
    comic = FactoryGirl.create(:comic)
    genre = FactoryGirl.create(:genre)
    review = FactoryGirl.create(:review, user_id: user.id, comic_id: comic.id)
    login_as(user,:scope => :user)
    visit comic_path(comic)
    click_button 'delete'
    expect(page).to have_content('Review Deleted!')
  end


  scenario  "user attempts to delete a review that is not theirs" do
    user = FactoryGirl.create(:user)
    other_user = FactoryGirl.create(:user)
    comic = FactoryGirl.create(:comic)
    genre = FactoryGirl.create(:genre)
    review = FactoryGirl.create(:review, user_id: other_user.id , comic_id: comic.id)
    login_as(user,:scope => :user)
    visit comic_path(comic)
    expect(page).to_not have_content('Edit Review')
  end 

end
