class OrderItemsController < ApplicationController
  def create
    order_item = OrderItem.new()
    order_item.quantity = params[:order_item][:quantity]
    order_item.menu_item = MenuItem.find(params[:item_id])
    order_item.order = Order.where(user: current_user, status: "in progress").first_or_create
    if order_item.save
      redirect_to menu_items_path(anchor: "menu-item-#{order_item.menu_item_id}")
    else
      redirect menu_items_path
    end
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    order_item.destroy!
    redirect_to checkout_order_path(Order.where(user: current_user, status: "in progress").first_or_create)
  end
end
