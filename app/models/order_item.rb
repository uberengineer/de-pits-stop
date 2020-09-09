class OrderItem < ApplicationRecord
  belongs_to :order, touch: true
  belongs_to :menu_item
  validates :quantity, presence: true, allow_blank: false
  before_save :check_if_exists_in_order

  def check_if_exists_in_order
    selected_item = OrderItem.find_by(order_id: self.order_id, menu_item_id: self.menu_item.id)
    if selected_item
      self.quantity = self.quantity + selected_item.quantity
      selected_item.destroy
    end
  end
end
