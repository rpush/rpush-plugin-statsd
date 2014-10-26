require 'rpush/plugin/statsd/version'

module Rpush
  module Plugin
    module Statsd
      plugin = Rpush.plugin(:statsd)
      plugin.url = 'https://github.com/rpush/rpush-plugin-statsd'
      plugin.description = 'Rpush plugin to sends stats to StatsD.'

      plugin.init do
        @statsd = ::Statsd.new(plugin.config.host, plugin.config.port)
        @statsd.namespace = 'rpush'
      end

      plugin.configure do |config|
        config.host = 'localhost'
        config.port = 9125
      end

      plugin.reflect do |on|
        on.error(_) { @statsd.increment(:error) }
      end
    end
  end
end
