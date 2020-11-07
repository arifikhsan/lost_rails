class Api::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  include DeviseTokenAuth::Concerns::SetUserByToken

  def authorize_request
    return render_require_auth unless auth_header
    return render_failed unless decode_token

    @current_user = User.find(@auth_decoded.first['user_id'])
  end

  def encode_token
    @access_token = JWT.encode payload, Rails.application.credentials[:jwt_secret_key]
  end

  def decode_token
    @auth_decoded = JWT.decode auth_header.split.last, Rails.application.credentials[:jwt_secret_key], true, algorithm: 'HS256'
  end

  def auth_header
    request.headers['Authorization']
  end

  def render_success
    render json: { message: 'success' }
  end

  def render_failed
    render json: { message: 'Gagal' }, status: 422
  end

  def render_wrong_credentials
    render json: { message: 'Kombinasi email dan password kurang tepat' }, status: 422
  end

  def render_registered
    render json: { message: 'Email telah terdaftar' }, status: 422
  end

  def render_require_auth
    render json: { message: 'require auth' }, status: 401
  end
end
