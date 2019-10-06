Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'], network_timeout: 3, pool_timeout: 3 }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'], network_timeout: 3, pool_timeout: 3 }
end

schedule_file = "config/schedule.yml"
if File.exist?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end