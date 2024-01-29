# Use Puppet to automate the task of creating a custom HTTP header response
# 2-puppet_custom_http_response_header.pp

# Install puppetlabs-stdlib module
package { 'puppet-module-puppetlabs-stdlib':
  ensure => 'installed',
}

# Update package repository
exec { 'update':
  command => '/usr/bin/apt-get update',
}

# Install Nginx package
package { 'nginx':
  ensure => 'installed',
}

# Configure Nginx with custom HTTP header
class { 'stdlib': }

file_line { 'custom_http_header':
  path  => '/etc/nginx/nginx.conf',
  line  => "add_header X-Served-By ${hostname};",
  match => 'http {',
}

notify { 'custom_http_header':
  require => File_line['custom_http_header'],
}

# Restart Nginx to apply changes
exec { 'run':
  command => '/usr/sbin/service nginx restart',
}
