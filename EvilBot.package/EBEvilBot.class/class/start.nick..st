accessing
start: aPassword nick: aString
	self 
		nick: aString
		channels: (self defaultchannels)
		password: aPassword