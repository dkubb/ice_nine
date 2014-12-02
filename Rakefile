# encoding: utf-8

require 'devtools'
Devtools.init_rake_tasks

Rake.application.load_imports

task('metrics:mutant').clear
namespace :metrics do
  task mutant: :coverage do
    $stderr.puts 'Zombie via devtools config is defunct mutant is disabled'
  end
end
