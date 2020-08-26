class User < ApplicationRecord
  has_one :user_detail

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:admin, :user]
  after_initialize :set_default_role, :if => :new_record?

  validates :email, :password, presence: true

  def set_default_role
    self.role ||= :user
  end

  def self.admin
    User.find_by(role: :admin)
  end
end
