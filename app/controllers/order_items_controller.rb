class OrderItemsController < ApplicationController
  def create
    order_item = OrderItem.new()
    order_item.quantity = params[:order_item][:quantity]
    order_item.menu_item = MenuItem.find(params[:item_id])
    order_item.order = Order.find_or_create_by(user: current_user, status: "in progress")
    order_item.save
    @order_item = order_item
  end

  def destroy
    order_item = OrderItem.find(params[:format])
    order_item.destroy!
    redirect_to checkout_order_path(Order.where(user: current_user, status: "in progress").first_or_create)
  end
end
