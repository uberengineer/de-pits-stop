class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :menu_items, through: :order_items
  monetize :amount_cents
  after_touch :calculate_amount_cents

  def calculate_amount_cents
    basket_price = order_items.joins(:menu_item).pluck(:price_cents, :quantity)
    self.amount_cents = basket_price.reduce(0) {|amount, new| amount + new.reduce{|price, quantity| price * quantity}}
    self.save
  end
end
