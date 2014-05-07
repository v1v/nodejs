require 'spec_helper'
require_relative '../libraries/helper'

describe NodejsCookbook::Helper do
  let(:shellout) { double('shellout') }
  let(:helper) { NodejsCookbook::Helper.new(node) }

  describe 'windows' do
    let(:node) do
      { 'nodejs' => { 'bin_dir' => ::File.join('c:', 'Program Files', 'nodejs') },
        'platform' => 'windows' }
    end

    it 'should check installed nodejs version' do
      node_path = 'c:/Program Files/nodejs/node.exe'
      Mixlib::ShellOut.should_receive(:new).with("\"#{node_path}\" --version").
        and_return(shellout)
      shellout.should_receive(:run_command)
      File.stub(:exists?).with(node_path).and_return(true)
      shellout.stub(:stdout).and_return("v0.10.15\n")

      expect(helper.installed_version()).to eq('v0.10.15')
    end
  end

  describe 'linux' do
    let(:node) do
      { 'nodejs' => { 'bin_dir' => '/usr/bin' },
        'platform' => 'ubuntu' }
    end

    it 'should check installed nodejs version' do
      node_path = '/usr/bin/node'
      Mixlib::ShellOut.should_receive(:new).with("\"#{node_path}\" --version").
        and_return(shellout)
      shellout.should_receive(:run_command)
      File.stub(:exists?).with(node_path).and_return(true)
      shellout.stub(:stdout).and_return("v0.10.15\n")

      expect(helper.installed_version()).to eq('v0.10.15')
    end
  end
end
