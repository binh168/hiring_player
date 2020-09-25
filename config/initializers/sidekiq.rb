Sidekiq.configure_server do |config|
  config.redis = {url: ENV["SIDEKIQ"]}
end

Sidekiq.configure_client do |config|
  config.redis = {url: ENV["SIDEKIQ"]}
end
