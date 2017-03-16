class UserMailerPreview < ActionMailer::Preview
  def order_confirmation_preview
    UserMailer.order_confirmation(User.first, Order.first)
  end
end