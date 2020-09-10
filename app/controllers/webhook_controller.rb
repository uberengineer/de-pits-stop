class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def mollie
    @payment = Mollie::Payment.get(params[:id])
    @order = Order.find_by(mollie_id: @payment.id)
    @order.payment_status = @payment.status
    @order.save

    if @order.payment_status == "paid"
    OrderChannel.broadcast_to(
       "orders",
      render_to_string(partial: "orders/order", locals: { order: @order })
      )
    end
  end
end
