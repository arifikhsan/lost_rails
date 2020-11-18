class Reward < ApplicationRecord
  belongs_to :item

  enum category: [:cash, :other]

  after_initialize :set_default_category, if: :new_record?

  def set_default_category
    self.category ||= :cash
  end
end
