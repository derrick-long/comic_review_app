require 'rails_helper'

feature 'delete a review' do

  let!(:user){ FactoryGirl.create(:user) }
  let!(:comic){ FactoryGirl.create(:comic) }
  let!(:genre){ FactoryGirl.create(:genre) }

  scenario "user deletes a review" do
    review = FactoryGirl.create(:review, user_id: user.id, comic_id: comic.id)
    user.confirm
    login_as(user)
    visit comic_path(comic)
    click_button 'delete'
    expect(page).to have_content('Review Deleted!')
  end



  scenario  "user attempts to delete a review that is not theirs" do
    other_user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user_id: other_user.id , comic_id: comic.id)
    user.confirm
    login_as(user)
    visit comic_path(comic)
    expect(page).to_not have_content('Edit Review')
  end

end
