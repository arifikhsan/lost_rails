class Group < ApplicationRecord
  extend FriendlyId

  belongs_to :user
  has_many :group_members
  has_one_attached :avatar

  friendly_id :name, use: :slugged, slug_column: :username

  validates_uniqueness_of :username, on: :create, message: 'must be unique'

  def should_generate_new_friendly_id?
    false
  end
end
