# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "rpush-plugin-statsd"
  spec.version       = '0.0.1'
  spec.authors       = ["Ian Leitch"]
  spec.email         = ["port001@gmail.com"]
  spec.summary       = 'Rpush plugin for StatsD.'
  spec.description   = 'Instrument Rpush with StatsD.'
  spec.homepage      = "https://github.com/rpush/rpush-plugin-statsd"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "statsd-ruby"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
