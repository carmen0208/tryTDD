require 'rails_helper'

RSpec.describe Achievement, type: :model do
  describe 'validations' do
    # it "requires title" do
    #   achievement = Achievement.new(title: '')
    #   achievement.valid?
    #   expect(achievement.errors[:title]).to include("can't be blank")
    #   expect(achievement.errors[:title]).not_to be_empty
    #   expect(achievement.valid?).to be_falsy
    # end

    it { should validate_presence_of(:title) }

    # it "requires title to be unique for one user" do
    #   user = FactoryGirl.create(:user)
    #   first_achievement = FactoryGirl.create(:public_achievement, title: 'First Achievement', user: user)
    #   new_achievement = Achievement.new(title: 'First Achievement', user: user)
    #   expect(new_achievement.valid?).to be_falsy
    # end
    #
    # it "allows different users to have achievements with identical title" do
    #   user1 = FactoryGirl.create(:user)
    #   user2 = FactoryGirl.create(:user)
    #   first_achievement = FactoryGirl.create(:public_achievement, title: 'First Achievement', user: user1)
    #   new_achievement = Achievement.new(title: 'First Achievement', user: user2)
    #   expect(new_achievement.valid?).to be_truthy
    # end
    it { should validate_uniqueness_of(:title).scoped_to(:user_id).with_message("you can't have two achievements with the same title")}
  end
  # 
  # it 'belongs to user' do
  #   achievement = Achievement.new(title: 'Some Title', user: nil)
  #   expect(achievement.valid?).to be_falsy
  # end

  it {should validate_presence_of(:user)}

  # it 'has belongs_to user assoication' do
  #   #1 approach
  #   user = FactoryGirl.create(:user)
  #   achievement = FactoryGirl.create(:public_achievement, user: user)
  #   expect(achievement.user).to eq(user)
  #
  #   #2 approach
  #   u = Achievement.reflect_on_association(:user)
  #   expect(u.macro).to eq(:belongs_to)
  #
  # end

  it { should belong_to(:user) }
end
