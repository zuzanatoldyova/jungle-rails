class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"
  layout 'mailer'

  def order_confirmation(user, order)
    @order = order
    @user = user
    mail(to: @user.email, subject: "Your order no #{@order.id} confirmation")
  end
end
