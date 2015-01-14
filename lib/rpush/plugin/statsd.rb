require 'statsd'

plugin = Rpush.plugin(:statsd)
plugin.url = 'https://github.com/rpush/rpush-plugin-statsd'
plugin.description = 'Rpush plugin to sends stats to StatsD.'

plugin.configure do |config|
  config.host = 'localhost'
  config.port = 9125
end

REFLECTIONS = [:error, :apns_feedback, :notification_enqueued, :notification_delivered,
 :notification_failed, :notification_id_failed, :notification_will_retry,
 :notification_id_will_retry, :tcp_connection_lost, :gcm_delivered_to_recipient,
 :gcm_failed_to_recipient, :gcm_invalid_registration_id, :adm_failed_to_recipient]

plugin.reflect do |on|
  REFLECTIONS.each do |reflection|
    block = -> (*args) { @statsd.increment(reflection) }
    on.send(reflection, &block)
  end
end

plugin.init do
  @statsd = ::Statsd.new(plugin.config.host, plugin.config.port)
  @statsd.namespace = 'rpush'
end
