class UserMailer < ApplicationMailer
  def order_mailer user
    @yesterday = Date.today - 1
    @user = user
    @orders_yesterday = user.passive_order.find_in_day @yesterday
    mail to: @user.email, subject: Settings.subject_mailer
  end
end
