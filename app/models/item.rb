class Item < ApplicationRecord
  belongs_to :user
  enum condition: [:lost, :found]
end
