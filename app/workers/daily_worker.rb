class DailyWorker
  include Sidekiq::Worker

  def perform users
    User.all.each do |user|
      UserMailer.order_mailer(user).deliver_now
    end
  end
end
