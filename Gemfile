# encoding: utf-8

source :rubygems

gemspec

group :metrics do
  gem 'fattr',       '~> 2.2.1'
  gem 'arrayfields', '~> 4.7.4'
  gem 'flay',        '~> 1.4.3'
  gem 'flog',        '~> 2.5.3'
  gem 'map',         '~> 5.4.0'
  gem 'reek',        '~> 1.2.8', :git => 'git://github.com/dkubb/reek.git'
  gem 'roodi',       '~> 2.1.0'
  gem 'yardstick',   '~> 0.4.0'

  platforms :mri_18, :rbx do
    gem 'heckle',    '~> 1.4.3'
    gem 'json',      '~> 1.6.5'
    gem 'mspec',     '~> 1.5.17'
    gem 'ruby2ruby', '=  1.2.2'
  end

  platforms :mri_18 do
    gem 'metric_fu', '~> 2.1.1'
    gem 'rcov',      '~> 1.0.0'
  end

  platforms :rbx do
    gem 'pelusa', '~> 0.2.0'
  end
end
