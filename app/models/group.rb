class Group < ApplicationRecord
  belongs_to :user
  has_many :group_members
  has_one_attached :avatar
end
