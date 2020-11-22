class CategoryItem < ApplicationRecord
  belongs_to :category
  belongs_to :item

  after_initialize :set_default_category, if: :new_record?

  def set_default_category
    self.category ||= Category.any_category
  end
end
