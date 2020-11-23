# Rpush::Plugin::Statsd

A plugin that instruments Rpush and sends metrics to StatsD.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rpush-plugin-statsd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rpush-plugin-statsd

## Configuration

```ruby
Rpush.config do |config|
  config.plugin.statsd do |statsd|
    statsd.host = "127.0.0.1"
    statsd.port = 9125
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rpush-plugin-statsd/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
