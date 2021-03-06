class Item < ApplicationRecord
  extend FriendlyId
  include PgSearch::Model

  belongs_to :user
  has_one :reward, dependent: :destroy
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items

  accepts_nested_attributes_for :category_items, allow_destroy: true
  accepts_nested_attributes_for :reward, allow_destroy: true

  enum condition: %i[lost found]
  enum status: %i[draft review published moderate]

  after_initialize :set_default_status, if: :new_record?

  scope :latest, -> { order(time_start: :desc) }
  scope :current_displayed, -> { where('time_start < ? AND time_end > ?', Time.now, Time.now) }
  scope :show_active, -> { published.latest.current_displayed }

  friendly_id :title, use: :slugged
  multisearchable against: %i[title detail]
  pg_search_scope :search_by_query, against: %i[title detail]

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  def set_default_status
    self.status ||= :published
  end

  def related
    if categories.first
      categories.first.items.where.not(id: id).latest.published.limit(6)
    else
      Item.latest.published.limit(6)
    end
  end
end
