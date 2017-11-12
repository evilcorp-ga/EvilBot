accessing
processPingFrom: anArray to: aLoc
	| aUser |
	aUser := (anArray first substrings: '!') first.
	lastPong := aLoc -> (Time now).
	self sendCommand: 'PRIVMSG ',aUser,' :',(Character home asString),'PING',(Character home asString).