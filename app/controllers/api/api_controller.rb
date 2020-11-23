class Api::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  include DeviseTokenAuth::Concerns::SetUserByToken

  def not_found
    render json: {aa: 123}, status: :not_found
  end

  def render_error(object)
    render json: { errors: object.errors.full_messages }, status: :unprocessable_entity
  end
end
