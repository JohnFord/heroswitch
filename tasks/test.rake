require 'rake'
require 'rake/testtask'

task :default => :test

Rake::TestTask.new do |t|
  # if rubygems is being used to manage $:, require it in the tests too
  t.ruby_opts += [ '-rubygems' ] if defined?(::Gem)

  t.libs    = ['.']
  t.pattern = 'test/test_*.rb'
  t.verbose = true
  t.warning = false
end
