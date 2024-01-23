# using puppet to install nginx

package { 'nginx ':
ensure => 'present',
}
exec {'install':
command  => 'sudo apt-get update ; sudo apt-get -y install nginx',
provider => shell,
}

exec {'Hello World!':
command  => 'echo "Hello World!" | sudo dd status=none of=/var/www/html/index.html',
provider => shell,
}

exec {'sed -i "/listen 80 default_server;/ a rewrite^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default':
provider => shell,
}

exec {'run':
command  => 'sudo service nginx restart',
provider => shell,
}
