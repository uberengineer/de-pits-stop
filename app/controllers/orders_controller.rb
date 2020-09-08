class OrdersController < ApplicationController
  def index
    if current_user.admin
      @orders = Order.select do |order|
        order.status == "not ready" || order.status == "awaiting pick-up"
      end

      @past_orders = Order.select do |order|
        order.status == "completed"
      end

      @current_orders = Order.select do |order|
        order.status == "completed"
      end
    else
      redirect_to menu_items_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def past_orders
    orders = Order.select do |order|
      order.status == "completed"
    end

    orders = orders.sort_by do |order|
      order.created_at
    end
    @orders = orders.reverse
  end

  def update
    @order = Order.find(params[:id])
    if @order.status == "in progress"
      @order.update(status: "not ready")
      @order.update(comment: params[:order][:comment])
      @order.update(time_started: Time.now)
      if params[:order][:pickup_time] == "As soon as possible"
         @order.update(pickup_time: params[:order][:pickup_time])
      else
        @order.update(pickup_time: Time.parse(params[:order][:pickup_time]).strftime("%H:%M"))
      end
      UserMailer.confirmation_email(@order.user).deliver_now
      redirect_to confirmation_path(@order)
    elsif @order.status == "not ready"
      @order.update(status: "awaiting pick-up")
      redirect_to orders_path
    elsif @order.status == "awaiting pick-up"
      @order.update(status: "completed")
      redirect_to orders_path
      @order.update(time_finished: Time.now)
    end
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
    @cart = Order.find_or_create_by(user: current_user, status: "in progress")
    time = Time.now + 45.minutes
    @times = ["As soon as possible"]
    while time <= Time.parse("15:00")
      time += 15.minutes
      time = Time.at(time.to_i - (time.to_i % 15.minutes))
      str_time = time.strftime("%H:%M")
      @times.push(str_time)
    end
    payment = Mollie::Payment.create(
      amount:       { value: '10.00', currency: 'EUR' },
      description:  'My first API payment',
      redirect_url: 'https://webshop.example.org/order/12345/',
      webhook_url:  'https://webshop.example.org/mollie-webhook/'
    )
  end

end
