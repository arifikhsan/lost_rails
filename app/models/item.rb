class Item < ApplicationRecord
  extend FriendlyId

  belongs_to :user
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items

  enum condition: [:lost, :found]
  enum status: [:draft, :review, :published, :moderate]

  after_initialize :set_default_status, if: :new_record?

  scope :latest, -> { order(time_start: :desc) }
  scope :current_displayed, -> { where('time_start < ? AND time_end > ?', Time.now, Time.now) }
  scope :show_active, -> { published.latest.current_displayed }

  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  def set_default_status
    self.status ||= :draft
  end

  def related
    categories.first.items.where.not(id: id).latest.published.limit(6)
  end
end
