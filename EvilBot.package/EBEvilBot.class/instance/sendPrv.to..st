accessing
sendPrv: aString to: anEntity
	| aPriv |
	aPriv := 'PRIVMSG ',anEntity,' :',aString.
	[ aPriv := aPriv utf8Encoded asString] on: Error do: [:ex | ].
	self log: aPriv.
	self sendCommand: aPriv.