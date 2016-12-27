require 'rails_helper'

feature 'achievement page' do
  let(:user) {FactoryGirl.create(:user)}
  scenario 'achievement public page' do
    # achievement = Achievement.create(title: 'Just did it')
    achievement = FactoryGirl.create(:achievement, title: 'Just did it', user: user)
    visit("/achievements/#{achievement.id}")

    expect(page).to have_content('Just did it')

    # achievements = FactoryGirl.create_list(:achievement,3)
    # p achievements
  end

  scenario 'render markdown description' do
    # it is hard because title can't be blank even if we only want to test is description
    achievement = FactoryGirl.create(:achievement, description: 'That **was** hard',user: user)
    visit("/achievements/#{achievement.id}")

    # expect(page).to have_content('<strong>was</strong>')
    expect(page).to have_css('strong',text: "was")

  end
end
