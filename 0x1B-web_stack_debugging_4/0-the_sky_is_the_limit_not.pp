# increase the ULIMIT

exec{'fix nginx ulimit':
    # Modify ULIMIT
    command => '/bin/sed -i "s/15/4096/" /etc/default/nginx',
    # Specify path for sed command
    path    => '/usr/local/bin/:/bin',
}

# Restart nginx
exec{'nginx-restart':
    command => 'sudo service nginx restart',
    # Specify path for the service command
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin']
}

