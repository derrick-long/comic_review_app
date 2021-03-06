require 'rails_helper'
feature 'update a review' do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
  end

      let!(:user){ FactoryGirl.create(:user) }
      let!(:comic){ FactoryGirl.create(:comic) }

    scenario 'user succesfully updates a review' do
      genre = FactoryGirl.create(:genre)
      review = FactoryGirl.create(:review, user_id: user.id, comic_id: comic.id)
      login_as(user)
      visit comic_path(comic)
      click_link 'Edit Review'
      fill_in 'Rating', with: 5
      fill_in 'Review', with: "This book was the best of all books."
      click_button 'Submit Edit'
      expect(page).to have_content('Review updated!')
    end

    scenario 'user unsuccesfully updates a review' do
      genre = FactoryGirl.create(:genre)
      review = FactoryGirl.create(:review, user_id: user.id, comic_id: comic.id)
      login_as(user)
      visit comic_path(comic)
      click_link 'Edit Review'
      fill_in 'Rating', with: "eggs"
      fill_in 'Review', with: ""
      click_button 'Submit Edit'
      expect(page).to have_content("Content can't be blank")
      expect(page).to have_content("Rating is not a number")
    end

end
