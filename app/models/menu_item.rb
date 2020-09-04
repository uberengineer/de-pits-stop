class MenuItem < ApplicationRecord
  has_many :order_items
  has_one_attached :image
  before_validation :two_decimals

  def two_decimals
    self.price = '%.2f' % self.price
  end
end
