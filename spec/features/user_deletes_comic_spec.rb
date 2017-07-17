require 'rails_helper'

feature 'delete a comic' do

  let!(:user){ FactoryGirl.create(:user) }
  let!(:genre){ FactoryGirl.create(:genre) }

  scenario 'user successfully deletes a comic they created' do
    comic = FactoryGirl.create(:comic, user_id: user.id)
    user.confirm
    login_as(user)
    visit root_path
    click_link 'Comics'
    click_button 'delete'
    expect(page).to have_content('Comic Deleted!')
  end

  scenario 'user attempts to delete a comic they did not create and are not an admin' do
    user_1 = FactoryGirl.create(:user)
    comic = FactoryGirl.create(:comic, user_id: user_1.id)
    user.confirm
    login_as(user)
    visit root_path
    click_link 'Comics'
    expect(page).to_not have_content('delete')
  end

  scenario 'admin successfully deletes a comic' do
    user_2 = FactoryGirl.create(:user, admin: true)
    comic = FactoryGirl.create(:comic)
    user_2.confirm
    login_as(user_2)
    visit root_path
    click_link 'Comics'
    click_button 'delete'
    expect(page).to have_content('Comic Deleted!')
  end

end
