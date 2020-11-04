class UserMailer < ApplicationMailer

  def confirmation_email(user, order)
    @user = user
    @order = order
    @current_orders_path = show_current_orders_url
    mail(to: @user.email, subject: 'Order Confirmation')
  end

  def pick_up_email(user)
    mail(to: user, subject: 'Order ready for pickup')
  end

end
