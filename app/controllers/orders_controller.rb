class OrdersController < ApplicationController
  def index
    @orders = Order.select do |order|
      order.status == "not ready" || order.status == "awaiting pick-up"
    end

    @past_orders = Order.select do |order|
      order.status == "completed"
    end

    @current_orders = Order.select do |order|
      order.status == "completed"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def past_orders
    @orders = Order.select do |order|
      order.status == "completed"
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.status == "in progress"
      @order.status = "not ready"
      redirect_to confirmation_path(@order)
    elsif @order.status == "not ready"
      @order.status = "awaiting pick-up"
      redirect_to orders_path
    elsif @order.status == "awaiting pick-up"
      @order.status = "completed"
      redirect_to orders_path
    end
    @order.save!
  end

  def show_current_orders
    @orders = current_user.orders.select do |order|
      order.status == "not ready" || order.status == "awaiting pick-up"
    end
  end

  def show_user_orders
    @orders = current_user.orders
  end

  def checkout
    @cart = Order.where(user: current_user, status: "in progress").first_or_create
  end

end
