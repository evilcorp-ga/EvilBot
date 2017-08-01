accessing
privateMsgFrom: anArray
	|aUser|
	aUser := (anArray first substrings: '!') first.
	Transcript crShow: aUser.
		self sendCommand: 'PRIVMSG ',aUser,' I got a private msg :3'