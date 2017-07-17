require 'rails_helper'

RSpec.feature "user votes on review" do


  let!(:user) { FactoryGirl.create(:user) }
  let!(:genre) { FactoryGirl.create(:genre) }
  let!(:comic) { FactoryGirl.create(:comic) }
  let!(:review) { FactoryGirl.create(:review, comic_id: comic.id) }

  scenario 'authenticated user upvotes a review' do
    visit "/"
    user.confirm
    login_as(user)
    click_link('Comics')
    click_link(comic.title)
    click_button("upvote-#{review.id}")

    expect(page).to have_content("Vote added!")
    expect(page).to have_content("1")
    DatabaseCleaner.clean
  end

  scenario 'authenticated user downvotes a review' do
    visit '/'
    user.confirm
    login_as(user)
    click_link('Comics')
    click_link(comic.title)
    click_button("-")

    expect(page).to have_content("Vote added!")
    expect(page).to have_content("-1")
    DatabaseCleaner.clean
  end

  scenario 'authenticated user changes equalizes their vote' do
    visit '/'
    user.confirm
    login_as(user)
    click_link('Comics')
    click_link(comic.title)
    click_button("-")
    click_button("+")

    expect(page).to have_content("Vote updated!")
    expect(page).to have_content("0")
    DatabaseCleaner.clean
  end

  scenario 'authenticated user tries to vote twice' do
    visit '/'
    user.confirm
    login_as(user)
    click_link('Comics')
    click_link(comic.title)
    click_button("-")
    click_button("-")

    expect(page).to have_content("You can only vote once!")
    DatabaseCleaner.clean
  end

    scenario 'unauthenticated user tries to vote' do
      visit '/'
      click_link('Comics')
      click_link(comic.title)

      expect(page).to_not have_content("+")
    end
end
