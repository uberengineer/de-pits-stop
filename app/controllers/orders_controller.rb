class OrdersController < ApplicationController
  def index
    @orders = Order.select do |order|
      order.status == "not ready"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.status = "not ready"
    @order.save!
    redirect_to menu_items_path
  end

  def show_user_orders
    @orders = current_user.orders
  end

  def checkout
    @cart = Order.first_or_create(user: current_user, status: "in progress")
  end

end
