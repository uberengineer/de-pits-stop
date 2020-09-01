class OrderItemsController < ApplicationController
  def create
    order_item = OrderItem.new()
    order_item.quantity = params[:order_item][:quantity]
    order_item.menu_item = MenuItem.find(params[:item_id])
    order_item.order = Order.find(params[:id])
    order_item.save!
    redirect_to menu_items_path
  end
end
