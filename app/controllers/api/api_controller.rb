class Api::ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  skip_before_action :verify_authenticity_token

  def render_not_found
    render json: { message: 'Not found' }, status: :not_found
  end

  def render_error_from(object)
    render json: { errors: object.errors.full_messages }, status: :unprocessable_entity
  end
end
