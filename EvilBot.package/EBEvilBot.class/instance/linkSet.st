accessing
linkSet
	^Dictionary new
		at: 'wiki' 
		put: (OrderedCollection with: 'http://wiki.evilcorp.ga' with: 'http://wiki.ixixslfnc2pk2urw.onion');
		at: 'paste' 
		put: (OrderedCollection with: 'http://paste.evilcorp.ga' with: 'http://paste.ixixslfnc2pk2urw.onion');
		at: 'irc' 
		put: (OrderedCollection with: 'http://irc.evilcorp.ga' with: 'http://irc.ixixslfnc2pk2urw.onion' with: 'http://blablah.evilcorp.ga' with: 'http://blablah.ixixslfnc2pk2urw.onion');
		yourself