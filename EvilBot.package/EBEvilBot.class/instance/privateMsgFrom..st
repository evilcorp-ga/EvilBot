accessing
privateMsgFrom: anArray
	|aUser|
	aUser := (anArray first substrings: '!') first.
		self sendPrv: 'I got a private msg :3' to: aUser