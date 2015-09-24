# encoding: utf-8

guard :bundler do
  watch('Gemfile')
end

# rubocop:disable LineLength
guard :rspec, cmd: 'bundle exec rspec', cmd_additional_args: File.read('.rspec').split.join(' '), failed_mode: :none do
  # run all specs if configuration is modified
  watch('Guardfile')           { 'spec' }
  watch('Gemfile.lock')        { 'spec' }
  watch('spec/spec_helper.rb') { 'spec' }

  # run all specs if supporting files files are modified
  watch(%r{\Aspec/(?:lib|support|shared)/.+\.rb\z}) { 'spec' }

  # run unit specs if associated lib code is modified
  watch(%r{\Alib/(.+)\.rb})                                           { |m| Dir["spec/unit/#{m[1]}"]         }
  watch(%r{\Alib/(.+)/support/(.+)\.rb\z})                            { |m| Dir["spec/unit/#{m[1]}/#{m[2]}"] }
  watch("lib/#{File.basename(File.expand_path('../', __FILE__))}.rb") { 'spec'                               }

  # run a spec if it is modified
  watch(%r{\Aspec/(?:unit|integration)/.+_spec\.rb\z})
end
