class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def not_found
    render json: {aa: 123}, status: :not_found
  end
end
