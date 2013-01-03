# encoding: utf-8

if ENV['COVERAGE'] == 'true'
  require 'simplecov'

  SimpleCov.start do
    command_name     'spec:unit'
    add_filter       'config'
    add_filter       'spec'
    minimum_coverage 100
  end
end

require 'spec'
require 'spec/autorun'

# require spec support files and shared behavior
Dir[File.expand_path('../{support,shared}/**/*.rb', __FILE__)].each do |file|
  require file
end

Spec::Runner.configure do |config|
end
