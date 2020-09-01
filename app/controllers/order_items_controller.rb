class OrderItemsController < ApplicationController
  def create
    order_item = OrderItem.new(parms[:quantity])
    order_item.menu_item = MenuItem.find(params[:id])
    if current_user.orders.last.status == "in progress"
      order_item.order = current_user.orders.last
    else
      order = Order.new()
      order.save!
      order_item.order = current_user.orders.last
    end
    order_item.save!
  end
end
