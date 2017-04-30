#
# Cookbook:: st2
# Recipe:: web
#
# Copyright (c) 2017 Brian Clark <brian@clark.zone>

include_recipe 'st2::_repo'

package 'st2web' do
  version node['st2']['version']
end

node.default['nginx']['repo_source'] = 'nginx'
node.default['nginx']['install_method'] = 'package'
node.default['nginx']['default_site_enabled'] = false

include_recipe 'chef_nginx::default'

key_content = node.run_state['st2_ssl_key_content'] || node['st2']['web']['ssl']['key_content']
cert_content = node.run_state['st2_ssl_cert_content'] || node['st2']['web']['ssl']['cert_content']

directory 'ssl cert directory' do
  path ::File.dirname(node['st2']['web']['ssl']['cert_path'])
  recursive true
  action :create
  only_if { cert_content }
end

file node['st2']['web']['ssl']['cert_path'] do
  content cert_content
  sensitive true
  owner 'root'
  group 'root'
  mode '0600'
  action :create
  only_if { cert_content }
  notifies :reload, 'service[nginx]'
end

directory 'ssl key directory' do
  path ::File.dirname(node['st2']['web']['ssl']['key_path'])
  recursive true
  action :create
  only_if { key_content }
end

file node['st2']['web']['ssl']['key_path'] do
  content key_content
  sensitive true
  owner 'root'
  group 'root'
  mode '0600'
  action :create
  only_if { key_content }
  notifies :reload, 'service[nginx]'
end

nginx_site 'st2.conf' do
  template 'nginx.conf.erb'
  cookbook 'st2'
  action :enable
end
