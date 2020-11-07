class Api::V1::UsersController < Api::ApiController
  before_action :authenticate_user!

  def me
    render json: {
      data: {
        message: "Welcome #{current_user.name}",
        user: current_user
      }
    }, status: 200
  end
end
