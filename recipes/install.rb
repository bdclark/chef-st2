#
# Cookbook:: st2
# Recipe:: install
#
# Copyright (c) 2017 Brian Clark <brian@clark.zone>

include_recipe 'st2::_repo'

package 'st2' do
  version node['st2']['version']
end
