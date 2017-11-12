accessing
processPingFrom: anArray to: aLoc
	| aUser  |
	aUser := (anArray first substrings: '!') first.
	(anArray last substrings: ' ') size > 1 ifTrue: [ aUser := (anArray last substrings: ' ') last trimBoth ].
	lastPong := aLoc -> (Time now).
	self sendCommand: 'PRIVMSG ',aUser,' :',(Character home asString),'PING',(Character home asString).