class Group < ApplicationRecord
  extend FriendlyId

  belongs_to :user
  has_many :group_members
  has_one_attached :avatar

  friendly_id :name, use: :slugged, slug_column: :username

  validates_uniqueness_of :username, on: :create, message: 'must be unique'

  after_initialize :set_default_avatar, if: :new_record?

  def should_generate_new_friendly_id?
    false
  end

  def set_default_avatar
    avatar.attach(io: Rails.root.join('app/assets/images/logo.png').open, filename: 'logo.png')
  end
end
