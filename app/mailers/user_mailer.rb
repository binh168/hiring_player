class UserMailer < ApplicationMailer
  def order_mailer user
    @yesterday = 1.day.ago
    @now = Time.now
    @user = user
    @orders_yesterday = user.passive_order.order_yesterday @yesterday, @now
    mail to: @user.email, subject: "Your's list order(s) yesterday"
  end
end
