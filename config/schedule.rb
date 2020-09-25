require_relative "environment"

env :PATH, ENV["PATH"]
set :environment, Rails.env
set :output, "log/cron_job.log"

every :day,  at: Settings.time_daily_mail do
  runner "DeliverDailyMailWorker.perform_async"
end
