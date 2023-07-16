# encoding: utf-8

require File.expand_path('../lib/ice_nine/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'ice_nine'
  gem.version     = IceNine::VERSION.dup
  gem.authors     = ['Dan Kubb']
  gem.email       = %w[dan.kubb@gmail.com]
  gem.description = 'Deep Freeze Ruby Objects'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/dkubb/ice_nine'
  gem.license     = 'MIT'

  gem.require_paths    = %w[lib]
  gem.files            = `git ls-files`.split($/)
  gem.test_files       = `git ls-files -- spec/{unit,integration}`.split($/)
  gem.extra_rdoc_files = %w[LICENSE README.md TODO]

  gem.required_ruby_version = '>= 2.7.3'

  gem.add_development_dependency('bundler', '~> 2.2',  '>= 2.2.33')
  gem.add_development_dependency('rake',    '~> 13.0', '>= 13.0.6')
end
