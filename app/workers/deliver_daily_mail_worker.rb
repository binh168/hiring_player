class DeliverDailyMailWorker
  include Sidekiq::Worker
  sidekiq_options queue: :users

  def perform
    User.all.each do |user|
      UserMailer.order_mailer(user).deliver_now
    end
  end
end
