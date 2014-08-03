class ruby(
){
	anchor { 'ruby::repo': }

	apt::ppa { 'ppa:brightbox/ruby-ng':
		before => Anchor['ruby::repo']
	}

	package { 'ruby2.1':
		require => Anchor['ruby::repo']
	}	
}
