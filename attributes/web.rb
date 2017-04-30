
default['st2']['web']['http_port'] = 80
default['st2']['web']['ssl_port'] = 443

default['st2']['web']['ssl']['enabled'] = true
default['st2']['web']['ssl']['key_path'] = '/etc/ssl/st2/st2.key'
default['st2']['web']['ssl']['cert_path'] = '/etc/ssl/st2/st2.crt'
default['st2']['web']['ssl']['key_content'] = nil
default['st2']['web']['ssl']['cert_content'] = nil
