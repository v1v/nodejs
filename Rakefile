require 'tailor/rake_task'
require 'foodcritic'
require 'daptiv-chef-ci/vagrant_task'

task :lint => [:build_number, :tailor, :foodcritic]
task :default => [:lint]

task :build_number do
  IO.write('version.txt', (ENV['BUILD_NUMBER'] ? "0.0.#{ENV['BUILD_NUMBER']}" : '0.0.1'))
end

FoodCritic::Rake::LintTask.new do |t|
  t.options = {
      :cookbook_paths => '.',
      :search_gems => true }
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
