
property :username, String, name_property: true
property :password, String
property :path, String, default: '/etc/st2/htpasswd'
property :supress_output, [true, false], default: true

default_action :add

action :add do
  raise 'password required for :add' unless property_is_set?(:password)

  file path do
    owner 'st2'
    group 'st2'
    mode '0600'
    action :create_if_missing
  end

  execute ":add htpasswd #{username}" do
    command "htpasswd -b #{new_resource.path} #{username} #{new_resource.password}"
    sensitive supress_output
    not_if "htpasswd -vb #{new_resource.path} #{username} #{new_resource.password}"
  end
end

action :remove do
  execute ":remove htpasswd #{username}" do
    command "htpasswd -D #{new_resource.path} #{username}"
    only_if do
      ::File.exist?(new_resource.path) &&
        !::File.readlines(new_resource.path).grep(/^#{username}:/).empty?
    end
  end
end

action_class do
  def whyrun_supported?
    true
  end
end
