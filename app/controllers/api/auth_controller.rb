class Api::AuthController < Api::ApiController
  before_action :authorize_request, only: :user
  before_action :set_user, only: [:login, :register]

  def login
    return render_wrong_credentials if @user.nil?
    return render_wrong_credentials unless @user.valid_password? params[:password]

    encode_token
  end

  def logout
    render_success
  end

  def register
    return render_registered if @user.present?

    @user = create_user
    return render_failed unless @user.id?
    render_success
  end

  def user; end

  private

  def set_user
    @user = User.find_by(email: params[:email].downcase)
  end

  def create_user
    newuser = User.create(email: params[:email], password: params[:password])
    newuser.build_user_detail(name: params[:name])
    newuser.save
    newuser
  end

  def login_params
    params.permit(:email, :password)
  end

  def register_params
    params.permit(:name, :email, :password)
  end

  def payload
    {
      user_id: @user.id,
      time: Time.now.to_i
    }
  end
end
