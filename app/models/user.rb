class User < ApplicationRecord
  # extend Devise::Models
  has_one :user_detail

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  include DeviseTokenAuth::Concerns::User

  enum role: [:admin, :user]
  after_initialize :set_default_role, :if => :new_record?

  # validates :email, :password, presence: true

  def set_default_role
    self.role ||= :user
  end

  def self.admin
    User.find_by(role: :admin)
  end

  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      user.username = auth.info.nickname # assuming the user model has a username
      #user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
