class UserDetail < ApplicationRecord
  belongs_to :user
  enum gender: %i[male female]

  extend FriendlyId
  friendly_id :username, use: :slugged

  validates_presence_of :user_id
end
