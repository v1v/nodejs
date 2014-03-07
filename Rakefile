require 'tailor/rake_task'
require 'foodcritic'
require 'rspec/core/rake_task'
require 'daptiv-chef-ci/vagrant_task'

task :default => [:build_number, :tailor, :foodcritic, :spec]

task :build_number do
  IO.write('version.txt', (ENV['BUILD_NUMBER'] ? "1.3.#{ENV['BUILD_NUMBER']}" : '1.3.0'))
end

FoodCritic::Rake::LintTask.new do |t|
  t.options = {
      :cookbook_paths => '.',
      :search_gems => true }
end

RSpec::Core::RakeTask.new do |task|
  task.pattern = 'spec/**/*_spec.rb'
  task.rspec_opts = ['--color', '-f documentation']
  task.rspec_opts << '-tunit'
end

Tailor::RakeTask.new

Vagrant::RakeTask.new :vagrant, 'Runs the Windows install recipe'

Vagrant::RakeTask.new :vagrant_binary, 'Runs the Linux install from binary recipe' do |t|
  t.environment = {
    :install_method => 'binary',
    :linux => true }
end

Vagrant::RakeTask.new :vagrant_package, 'Runs the Linux install from package recipe' do |t|
  t.environment = {
    :install_method => 'package',
    :linux => true }
end

Vagrant::RakeTask.new :vagrant_source, 'Runs the Linux install from source recipe' do |t|
  t.environment = {
    :install_method => 'source',
    :linux => true }
end
