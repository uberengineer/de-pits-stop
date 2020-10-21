class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    unless current_user.admin
      redirect_to menu_items_path
    end
  end

  def confirmation
    if current_user.admin
      redirect_to menu_items_path
    end
    @order = Order.find(params[:id])
    @payment = Mollie::Payment.get(@order.mollie_id)
    @order.payment_status = @payment.status
    @order.save
  end

  def instructions
  end

  def closed_kitchen
    if @kitchen.kitchen_status
      redirect_to menu_items_path
    end
  end
end
