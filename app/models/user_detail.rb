class UserDetail < ApplicationRecord
  belongs_to :user
  enum gender: [:male, :female]

  extend FriendlyId
  friendly_id :username, use: :slugged
end
