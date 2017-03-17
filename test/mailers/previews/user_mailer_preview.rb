class UserMailerPreview < ActionMailer::Preview

  # http://localhost:3000/rails/mailers/user_mailer/order_confirmation_preview

  def order_confirmation_preview
    UserMailer.order_confirmation(User.first, Order.first)
  end
end