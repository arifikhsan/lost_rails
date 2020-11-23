class Api::V1::UsersController < Api::ApiController
  before_action :authenticate_user!
  before_action :set_user

  def me
    render json: {
      data: {
        message: "Welcome #{current_user.name}",
        user: current_user
      }
    }, status: 200
  end

  def update
    @user.update(user_params)

    render_error unless @user.valid?
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
