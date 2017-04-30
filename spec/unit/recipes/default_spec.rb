#
# Cookbook:: st2
# Spec:: default
#
# The MIT License (MIT)
#
# Copyright:: 2017, Brian Clark
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'spec_helper'

describe 'st2::default' do
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
