class Api::V1::UserDetailsController < Api::ApiController
  before_action :authenticate_user!
  before_action :set_user_detail

  def index
  end

  def show
  end

  def update
    @user_detail.update(user_detail_params)
    render_error unless @user_detail.valid?
  end

  private

  def set_user_detail
    @user = current_user
    @user_detail = @user.user_detail
  end

  def user_detail_params
    params.require(:user_detail).permit(
      :username,
      :phone_number,
      :whatsapp_phone_number,
      :dob,
      :gender
    )
  end
end
