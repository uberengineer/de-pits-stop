class UserMailer < ApplicationMailer
  default from: 'maviles2001@gmail.com'

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Order Confirmation')
  end

  def pick_up_email(user)
    @user = user
    mail(to: @user.email, subject: 'Order Confirmation')
  end
end
