require 'rake/testtask'
require_relative 'lib/mtg_bot'

task :default => :start

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

task :start do
  MtgBot.start
end
