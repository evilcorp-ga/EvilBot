accessing
linkSet
	"Default linkset, change for your own set of links"
	^Dictionary new
		at: 'wiki' 
		put: (OrderedCollection with: 'http(s)://wiki.evilcorp.ga' with: 'http://wiki.evilcorp6tqdni55.onion');
		at: 'paste' 
		put: (OrderedCollection with: 'http(s)://paste.evilcorp.ga' with: 'http://paste.evilcorp6tqdni55.onion');
		at: 'irc' 
		put: (OrderedCollection 
			with: 'http(s)://irc.evilcorp.ga' with: 'http://irc.evilcorp6tqdni55.onion' 
			with: 'http(s)://blablah.evilcorp.ga' with: 'http://blablah.evilcorp6tqdni55.onion'
			with: 'http(s)://hack.evilcorp.ga' with: 'http://hack.evilcorp6tqdni55.onion');
		at: 'forum'
		put: (OrderedCollection with: 'http(s)://forum.evilcorp.ga' with: 'http://forum.evilcorp6tqdni55.onion');
		at: 'discord'
		put: (OrderedCollection with: 'https://discord.me/evilcorp');
		yourself