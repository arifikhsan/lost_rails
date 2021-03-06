class Api::V1::AuthController < DeviseTokenAuth::OmniauthCallbacksController
  before_action :set_resource

  def signin_from_google
    # @resource.update(tokens: nil)
    @token = @resource.create_token
    @resource.save
    sign_in(@resource)

    response.set_header('access-token', @token.token)
    response.set_header('token-type', 'Bearer')
    response.set_header('client', @token.client)
    response.set_header('expiry', @token.expiry)
    response.set_header('uid', @resource.uid)

    render json: {
      data: resource_data(resource_json: @resource.token_validation_response)
    }
  end

  private

  def set_resource
    user = User.where(email: profile_params[:email], uid: profile_params[:id]).first_or_create do |user|
      user.provider = account_params[:provider]
      user.name = user_params[:name]
      user.image = user_params[:image]
      user.role = :user
      user.save
    end
    if user.user_detail.blank?
      user.build_user_detail(username: user.name.split.join.downcase)
      user.save
    end
    @resource = user
  end

  def user_params
    params.require(:user).permit(:name, :image)
  end

  def account_params
    params.require(:account).permit(:provider)
  end

  def profile_params
    params.require(:profile).permit(:id, :email)
  end
end
