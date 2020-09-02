class OrdersController < ApplicationController
  def index
    @orders = Order.select do |order|
      order.status == "not ready"
    end

    @past_orders = Order.select do |order|
      order.status == "completed"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.status = "not ready"
    @order.save!
  end

  def show_user_orders
    @orders = current_user.orders
  end

end
