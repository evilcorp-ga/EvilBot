accessing
privateMsgFrom: anArray
	|aUser|
	aUser := (anArray first substrings: '!') first.
		self sendCommand: 'PRIVMSG ',aUser,' I got a private msg :3'