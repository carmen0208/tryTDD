require 'rails_helper'
require_relative '../support/new_achievement_form'
require_relative '../support/login_form'
feature 'create new achievement' do
  let(:login_form) {LoginForm.new}
  let(:new_achievement_form) { NewAchievementForm.new }
  let(:user) {FactoryGirl.create(:user)}

  background do
    login_form.visit_page.login_as(user)
  end
  scenario 'create new achievement with valid data', :vcr do
    # new_achievement_form = NewAchievementForm.new
    # login_form.visit_page.login_as(user)
    new_achievement_form.visit_page.fill_in_with(
      title: 'Read a book',
      cover_image: 'cover_image.png'
    ).submit

    #Email test
    expect(ActionMailer::Base.deliveries.count).to eq(1)
    expect(ActionMailer::Base.deliveries.last.to).to include(user.email)

    # File upload test
    expect(Achievement.last.cover_image_identifier).to eq('cover_image.png')

    expect(page).to have_content('Achievement has been created')
    expect(Achievement.last.title).to eq('Read a book')

    # 3rd Party API test
    expect(page).to have_content("We tweeted for you! https://twitter.com")
    # visit('/')
    # click_on('New Achievement')
    #
    # fill_in('Title', with: 'Read a book')
    # fill_in('Description', with: 'Excellent read')
    # select('Public', from: 'Privacy')
    # check('Featured achievement')
    # attach_file('Cover image', "#{Rails.root}/spec/fixtures/cover_image.png")
    # click_on('Create Achievement')

  end

  scenario 'cannot create achievement with invalid data' do

      new_achievement_form.visit_page.submit
      expect(page).to have_content("can't be blank")

  end
end
