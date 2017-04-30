#
# Cookbook:: st2
# Recipe:: configure
#
# Copyright (c) 2017 Brian Clark <brian@clark.zone>

directory '/etc/st2' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/etc/st2/st2.conf' do
  source 'st2.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables config: lazy { node['st2']['config'] }
  action :create
end

# List of available `st2` services:
# https://github.com/StackStorm/st2/blob/master/st2common/bin/st2ctl#L5
ST2_SERVICES = %w(
  st2actionrunner
  st2api
  st2auth
  st2garbagecollector
  st2notifier
  st2resultstracker
  st2rulesengine
  st2sensorcontainer
  st2stream
).freeze

# Enable & Start st2 services
ST2_SERVICES.each do |service_name|
  service service_name do
    action [:enable, :start]
    subscribes :restart, 'template[/etc/st2/st2.conf]', :delayed
  end
end
