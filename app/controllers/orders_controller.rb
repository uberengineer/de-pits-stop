class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:order_items, :menu_items, :user).where(payment_status: "paid")
    if current_user.admin
      @orders = @orders.select do |order|
        order.status == "not ready" || order.status == "awaiting pick-up"
      end
      @past_orders = @orders.select do |order|
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
      @order.status = "not ready"
      @order.comment = params[:order][:comment]
      @order.time_started = Time.now
      if params[:order][:pickup_time] == "As soon as possible"
         @order.pickup_time = params[:order][:pickup_time]
      else
        @order.pickup_time = Time.parse(params[:order][:pickup_time]).strftime("%H:%M")
      end
      payment = Mollie::Payment.create(
        amount:       { value: humanized_money(@order.amount), currency: 'EUR' },
        description:  @order.id.to_s,
        redirect_url: confirmation_url(@order, host: 'https://de-pits-stop.herokuapp.com'),
        webhook_url:  webhook_url(host: 'https://de-pits-stop.herokuapp.com')
        )
      
      @order.mollie_id = payment.id
      @order.save
      redirect_to payment.checkout_url
      # UserMailer.confirmation_email(@order.user, @order).deliver_now
    elsif @order.status == "not ready"
      @order.status = "awaiting pick-up"
      # UserMailer.pick_up_email(@order.user).deliver_now
      redirect_to orders_path
    else @order.status == "awaiting pick-up"
      @order.status = "completed"
      redirect_to orders_path
      @order.time_finished = Time.now
    end
      @order.save
  end

  def show_current_orders
    @orders = current_user.orders.select do |order|
      order.status != "in progress"
    end
  end

  def show_user_orders
    @orders = current_user.orders
  end

  def checkout
    @cart = Order.where(user: current_user, status: "in progress").first_or_create
    time = Time.now + 45.minutes
    @times = ["As soon as possible"]
    while time <= Time.parse("15:00")
      time += 15.minutes
      time = Time.at(time.to_i - (time.to_i % 15.minutes))
      str_time = time.strftime("%H:%M")
      @times.push(str_time)
    end
  end
end
