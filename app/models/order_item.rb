class OrderItem < ApplicationRecord
  before_validation :check_if_exists_in_order
  belongs_to :order
  belongs_to :menu_item

  def check_if_exists_in_order
    if OrderItem.find_by(order_id: self.order_id, menu_item_id: self.menu_item.id)
      self.quantity =  self.quantity + OrderItem.find_by(order_id: self.order_id, menu_item_id: self.menu_item.id).quantity
      OrderItem.find_by(order_id: self.order_id, menu_item_id: self.menu_item.id).destroy
    end
  end
end


