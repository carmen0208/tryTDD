require 'rails_helper'

describe AchievementsController do

  describe "Get index" do
    it "renders :index template" do
      get :index
      expect(response).to render_template(:index)
    end
    it "assigns only public achievement to template" do
      public_achievement = FactoryGirl.create(:public_achievement)
      private_achievement = FactoryGirl.create(:private_achievement)

      get :index
      expect(assigns[:achievements]).to match_array([public_achievement])
    end
  end

  describe "Get edit" do
    let(:achievement) {FactoryGirl.create(:public_achievement)}
    it "renders :edit template" do
      get :edit, id: achievement
      expect(response).to render_template(:edit)
    end
    it "assigns the request achievement to template" do
      get :edit, id: achievement
      expect(assigns(:achievement)).to eq(achievement)
    end
  end
  describe "Get new" do
    it "renders :new template" do
      get :new
      expect(response).to render_template(:new)
    end
    it "assigns new Achievement to @achievement" do
      get :new
      expect(assigns(:achievement)).to be_a_new(Achievement)
    end
  end

  describe "Get show" do
    let(:achievement) {FactoryGirl.create(:public_achievement)}
    it "renders :show template" do
      get :show, id: achievement.id
      expect(response).to render_template(:show)
    end
    it "assigns requested achievement to @achievement" do
      get :show, id: achievement
      expect(assigns(:achievement)).to eq(achievement)
    end
  end

  describe "PUT update" do
    let (:achievement) {FactoryGirl.create(:public_achievement)}
    context "valid data" do
      let(:valid_data) {FactoryGirl.attributes_for(:public_achievement, title: "New Title")}
      it "redirect to achievements#show" do
        put :update, id: achievement, achievement: valid_data
        expect(response).to redirect_to(achievement)
      end
      it "updata achievement in database" do
        put :update, id: achievement, achievement: valid_data
        #resync the data from database
        achievement.reload
        expect(achievement.title).to eq("New Title")
      end
    end
    context "invalid data" do
      let(:invalid_data) {FactoryGirl.attributes_for(:public_achievement, title: "", description: 'new')}
      it "renders :edit template" do
        put :update, id: achievement, achievement: invalid_data
        expect(response).to render_template(:edit)

      end
      it "doesn't update achievement in the database" do
        put :update, id: achievement, achievement: invalid_data
        achievement.reload
        expect(achievement.description).not_to eq('new')

      end
    end

  end
  describe "Post create" do
    let(:valid_data) {FactoryGirl.attributes_for(:public_achievement)}

    context "valid data " do
      it "redirects to achievements#show" do
        post :create, achievement: valid_data
        expect(response).to redirect_to(achievement_path(assigns[:achievement]))
      end
      it "creates new achievement in database" do
        expect {
          post :create, achievement: valid_data
        }.to change(Achievement, :count).by(1)
      end
    end

    context "invalid data" do
      let(:invalid_data) {FactoryGirl.attributes_for(:public_achievement, title: '')}
      it "renders :new template" do
        post :create, achievement: invalid_data
        expect(response).to render_template(:new)
      end
      it "doesn't create new achievement in database" do
        expect {
          post :create, achievement: invalid_data
        }.not_to change(Achievement, :count)
      end
    end

  end

  describe "Delete destory" do
    let(:achievement) {FactoryGirl.create(:public_achievement)}
    it "redirects to achievement#index" do
      delete :destroy, id: achievement
      expect(response).to redirect_to(achievements_path)
    end
    it "delete achievements from database" do
      delete :destroy, id: achievement
      expect(Achievement.exists?(achievement.id)).to be_falsy
    end
  end
end
