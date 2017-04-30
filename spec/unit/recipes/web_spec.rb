#
# Cookbook:: st2
# Spec:: web
#
# Copyright:: 2017, Brian Clark

require 'spec_helper'

describe 'st2::web' do
  context 'When all attributes are default, on ubuntu platform' do
    let(:platform) { 'ubuntu' }
    let(:version) { '14.04' }
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: platform, version: version) do |node|
        node.default['st2']['system_password'] = 'changeme'
      end
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      stub_command('htpasswd -vb /etc/st2/htpasswd st2admin changeme').and_return(0)
      expect { chef_run }.to_not raise_error
    end
  end
end
