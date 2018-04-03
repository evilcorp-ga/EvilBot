accessing
sendPrv: aString to: anEntity
	self log: 'PRIVMSG ',anEntity,' :',aString.
	self sendCommand: 'PRIVMSG ',anEntity,' :',aString