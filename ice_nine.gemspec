# encoding: utf-8

require File.expand_path('../lib/ice_nine/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'ice_nine'
  gem.version     = IceNine::VERSION
  gem.authors     = [ 'Dan Kubb' ]
  gem.email       = [ 'dan.kubb@gmail.com' ]
  gem.description = 'Deep Freeze Ruby Objects'
  gem.summary     = gem.description
  gem.homepage    = "https://github.com/dkubb/ice_nine"

  gem.require_paths    = %w[ lib ]
  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[ LICENSE README.md TODO ]

  gem.add_development_dependency('rake',  '~> 0.9.2.2')
  gem.add_development_dependency('rspec', '~> 1.3.2')
end
