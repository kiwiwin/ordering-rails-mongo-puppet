class git(
){
	anchor { 'git::repo': }

	apt::ppa { 'ppa:git-core/ppa': 
		before => Anchor['git::repo'],
	}

	package { 'git':
		require => Anchor['git::repo']
	}
}