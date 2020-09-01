class OrderItemsController < ApplicationController
  def create
    order_item = OrderItem.new(strong_params)
    order_item.order = current_user.orders.last
  end

  def strong_params
    #TODO
  end
end
