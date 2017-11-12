accessing
linkSet
	^Dictionary new
		at: 'wiki' 
		put: (OrderedCollection with: 'http://wiki.evilcorp.ga' with: 'http://wiki.evilcorp6tqdni55.onion');
		at: 'paste' 
		put: (OrderedCollection with: 'http://paste.evilcorp.ga' with: 'http://paste.evilcorp6tqdni55.onion');
		at: 'irc' 
		put: (OrderedCollection with: 'http://irc.evilcorp.ga' with: 'http://irc.evilcorp6tqdni55.onion' with: 'http://blablah.evilcorp.ga' with: 'http://blablah.evilcorp6tqdni55.onion');
		yourself