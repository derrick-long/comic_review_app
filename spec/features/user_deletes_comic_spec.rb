require 'rails_helper'

feature 'delete a comic' do

  scenario 'user successfully deletes a comic they created' do
    user = FactoryGirl.create(:user)
    comic = FactoryGirl.create(:comic, user_id: user.id)
    genre = FactoryGirl.create(:genre)
    user.confirm
    login_as(user)
    visit root_path
    click_link 'Comics'
    click_button 'delete'
    expect(page).to have_content('Comic Deleted!')
  end

  scenario 'user attempts to delete a comic they did not create and are not an admin' do
    user = FactoryGirl.create(:user)
    user_1 = FactoryGirl.create(:user)
    comic = FactoryGirl.create(:comic, user_id: user_1.id)
    genre = FactoryGirl.create(:genre)
    user.confirm
    login_as(user)
    visit root_path
    click_link 'Comics'
    expect(page).to_not have_content('delete')
  end

  scenario 'admin successfully deletes a comic' do
    user = FactoryGirl.create(:user, admin: true)
    comic = FactoryGirl.create(:comic)
    genre = FactoryGirl.create(:genre)
    user.confirm
    login_as(user)
    visit root_path
    click_link 'Comics'
    click_button 'delete'
    expect(page).to have_content('Comic Deleted!')
  end

end
