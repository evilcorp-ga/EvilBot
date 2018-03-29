accessing
linkSet
	"Default linkset, change for your own set of links"
	^Dictionary new
		at: 'wiki' 
		put: 'http(s)://wiki.evilcorp.ga http://wiki.evilcorp6tqdni55.onion';
		at: 'paste' 
		put: 'http(s)://paste.evilcorp.ga http://paste.evilcorp6tqdni55.onion';
		at: 'irc' 
		put: 'http(s)://irc.evilcorp.ga http://irc.evilcorp6tqdni55.onion http(s)://blablah.evilcorp.ga http://blablah.evilcorp6tqdni55.onion http(s)://hack.evilcorp.ga http://hack.evilcorp6tqdni55.onion';
		at: 'forum'
		put: 'http(s)://forum.evilcorp.ga http://forum.evilcorp6tqdni55.onion';
		at: 'discord'
		put: 'https://discord.me/evilcorp';
		yourself