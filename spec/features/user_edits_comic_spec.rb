require 'rails_helper'

feature 'editing a comic' do

  scenario 'user edits comic successfully' do
    user = FactoryGirl.create(:user)
    comic = FactoryGirl.create(:comic, user_id: user.id)
    genre = FactoryGirl.create(:genre)
    login_as(user,:scope => :user)
    visit comic_path(comic)
    click_link 'Edit Comic'
    fill_in 'Title', with: 'The Best Book'
    click_button 'Submit Edit'
    expect(page).to have_content('The Best Book')
  end

  scenario "user tries to edit a comic that isn't theirs" do
    user = FactoryGirl.create(:user)
    genre = FactoryGirl.create(:genre)
    comic = FactoryGirl.create(:comic, user_id: 10000)
    login_as(user,:scope => :user)
    visit comic_path(comic)
    expect(page).to_not have_content('Edit Comic')
  end

end
