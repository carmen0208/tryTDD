class Api::AchievementsController < ApiController
  def index
    # p request.headers["Content-Type"]
    achievements = Achievement.public_access
    render json: achievements
  end
end
