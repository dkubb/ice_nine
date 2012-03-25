# encoding: utf-8

begin
  begin
    require 'rspec/core/rake_task'
  rescue LoadError
    require 'spec/rake/spectask'

    module RSpec
      module Core
        RakeTask = Spec::Rake::SpecTask
      end
    end
  end

  desc 'Run all specs'
  task :spec => %w[ spec:unit spec:integration ]

  namespace :spec do
    RSpec::Core::RakeTask.new(:integration) do |t|
      t.pattern = 'spec/integration/**/*_spec.rb'
    end

    RSpec::Core::RakeTask.new(:unit) do |t|
      t.pattern = 'spec/unit/**/*_spec.rb'
    end
  end
rescue LoadError
  task :spec do
    abort 'rspec is not available. In order to run spec, you must: gem install rspec'
  end
end

begin
  if RUBY_VERSION < '1.9'
    desc 'Generate code coverage'
    RSpec::Core::RakeTask.new(:coverage) do |t|
      t.rcov      = true
      t.pattern   = 'spec/unit/**/*_spec.rb'
      t.rcov_opts = File.read('spec/rcov.opts').split(/\s+/)
    end
  else
    desc 'Generate code coverage'
    task :coverage do
      ENV['COVERAGE'] = 'true'
      Rake::Task['spec:unit'].execute
    end
  end
rescue LoadError
  task :coverage do
    lib = RUBY_VERSION < '1.9' ? 'rcov' : 'simplecov'
    abort "coverage is not available. In order to run #{lib}, you must: gem install #{lib}"
  end
end

task :test => 'spec'
