
default['st2']['version'] = nil

default['st2']['admin_user'] = 'st2admin'
default['st2']['admin_password'] = 'changeme'

default['st2']['config']['api'] = {
  host: '0.0.0.0',
  port: 9101,
  logging: '/etc/st2/logging.api.conf',
  mask_secrets: true,
  allow_origin: '*'
}
default['st2']['config']['stream'] = {
  host: '0.0.0.0',
  port: 9102,
  logging: '/etc/st2/logging.stream.conf'
}
default['st2']['config']['sensorcontainer'] = {
  logging: '/etc/st2/logging.sensorcontainer.conf'
}
default['st2']['config']['rulesengine'] = {
  logging: '/etc/st2/logging.rulesengine.conf'
}
default['st2']['config']['actionrunner'] = {
  logging: '/etc/st2/logging.actionrunner.conf',
  virtualenv_opts: '--always-copy'
}
default['st2']['config']['resultstracker'] = {
  logging: '/etc/st2/logging.resultstracker.conf'
}
default['st2']['config']['notifier'] = {
  logging: '/etc/st2/logging.notifier.conf'
}
default['st2']['config']['exporter'] = {
  logging: '/etc/st2/logging.exporter.conf'
}
default['st2']['config']['garbagecollector'] = {
  logging: '/etc/st2/logging.garbagecollector.conf'
}
default['st2']['config']['auth'] = {
  host: '0.0.0.0',
  port: 9100,
  use_ssl: false,
  debug: false,
  logging: '/etc/st2/logging.auth.conf',
  mode: 'standalone',
  backend: 'flat_file',
  backend_kwargs: {
    file_path: '/etc/st2/htpasswd'
  },
  api_url: 'http://127.0.0.1:9101'
}
default['st2']['config']['system'] = {
  base_path: '/opt/stackstorm'
}
default['st2']['config']['log'] = {
  excludes: 'requests,paramiko',
  redirect_stderr: false,
  mask_secrets: true
}
default['st2']['config']['system_user'] = {
  user: nil, # defaults to node['st2']['system_user']['user']
  ssh_key_file: nil # defaults to "#{node['st2']['system_user']['home']}/.ssh/id_rsa"
}
