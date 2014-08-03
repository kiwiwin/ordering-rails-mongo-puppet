exec { 'init-update':
	command => 'apt-get update',
	path	=> '/usr/bin'
}

class { 'apt':
	always_apt_update => true,
	require => Exec['init-update']
}

include git
include ruby
include mongodb