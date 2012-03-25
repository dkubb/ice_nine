# encoding: utf-8

begin
  require 'rspec'  # try for RSpec 2
rescue LoadError
  require 'spec'   # try for RSpec 1
  RSpec = Spec::Runner
end

# require spec support files and shared behavior
Dir[File.expand_path('../shared/**/*.rb', __FILE__)].each do |file|
  require file
end

RSpec.configure do |config|
end

if RUBY_VERSION >= '1.9' and ENV['COVERAGE'] == 'true'
  require 'simplecov'
  SimpleCov.start do
    command_name 'spec:unit'
    add_filter   'spec'
  end
end

# change the heckle timeout to be 5 seconds
if defined?(::Heckle)
  class ::Heckle
    @@timeout = 5
  end
end
