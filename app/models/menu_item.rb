class MenuItem < ApplicationRecord
  has_many :order_items
  has_one_attached :image
end
