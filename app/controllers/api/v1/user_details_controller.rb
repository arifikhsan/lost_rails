class Api::V1::UserDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
  end

  def show
  end

  private

  def set_user
    @user = current_user
    @user_detail = @user.user_detail
  end
end
