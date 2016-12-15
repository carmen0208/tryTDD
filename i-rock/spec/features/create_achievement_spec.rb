require 'rails_helper'
require_relative '../support/new_achievement_form'
feature 'create new achievement' do
  let(:new_achievement_form) { NewAchievementForm.new }
  scenario 'create new achievement with valid data' do
    # new_achievement_form = NewAchievementForm.new
    new_achievement_form.visit_page.fill_in_with(
      title: 'Read a book'
    ).submit

    expect(page).to have_content('Achievement has been created')
    expect(Achievement.last.title).to eq('Read a book')

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
