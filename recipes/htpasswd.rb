#
# Cookbook:: st2
# Recipe:: htpasswd
#
# Copyright (c) 2017 Brian Clark <brian@clark.zone>

package 'htpasswd-utils' do
  package_name value_for_platform_family(
    %w(debian) => 'apache2-utils',
    %w(rhel) => 'httpd-tools'
  )
end

admin_password = node.run_state['st2_admin_password'] || node['st2']['admin_password']

st2_htpasswd node['st2']['admin_user'] do
  password admin_password
  path node['st2']['config']['auth']['backend_kwargs']['file_path']
  only_if { node['st2']['config']['auth']['mode'] == 'standalone' }
  not_if { admin_password.nil? }
end
