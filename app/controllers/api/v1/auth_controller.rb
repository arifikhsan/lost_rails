class Api::V1::AuthController < DeviseTokenAuth::OmniauthCallbacksController
  before_action :set_resource

  def signin_from_google
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
    user = User.find_or_create_by(email: profile_params[:email], uid: profile_params[:id]) do |user|
      user.provider = account_params.provider
      user.name = user_params.name
      user.image = user_params.image
      user.save
    end
    @resource = user
  end

  def user_params
    params.require(:user)
  end

  def account_params
    params.require(:account)
  end

  def profile_params
    params.require(:profile)
  end
end
