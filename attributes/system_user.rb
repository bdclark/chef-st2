
# StackStorm default user for remote operations which require ssh access.
default['st2']['system_user']['user'] = 'stanley'
default['st2']['system_user']['group'] = 'stanley'
default['st2']['system_user']['shell'] = nil
default['st2']['system_user']['home'] = nil # defaults to "/home/#{user}"
default['st2']['system_user']['ssh_authorized_keys'] = []
default['st2']['system_user']['ssh_key_content'] = nil
default['st2']['system_user']['ssh_public_key_content'] = nil
default['st2']['system_user']['ssh_key_bits'] = 2048
default['st2']['system_user']['enable_sudo'] = true
