require 'tailor/rake_task'
require 'foodcritic'
require 'daptiv-chef-ci/vagrant_task'

task :lint => [:tailor, :foodcritic]
task :default => [:lint]

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
