# increase hard limit for holberton user

exec{'increase hard limit file':
	command => 'sed -i "/holberton hard/s/5/50000/" /etc/security/limits.conf',
	path    => '/usr/local/bin/:/bin/',
}

# increase soft limit for holberton user
exec { 'increase-soft-file-limit-for-holberton-user':
	command => 'sed -i "/holberton soft/s/4/50000/" /etc/security/limits.conf',
	path    => '/usr/local/bin/:/bin/',
}
