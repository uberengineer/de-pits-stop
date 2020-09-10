class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def mollie
    @payment = Mollie::Payment.get(params[:id])
    @order = Order.find_by(mollie_id: @payment.id)
    @order.payment_status = @payment.status
    @order.save
  end
end

