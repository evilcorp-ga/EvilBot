accessing
sendAct: aString to: anEntity
	self sendCommand: 'PRIVMSG ',anEntity,':',(Character home asString),'ACTION ',aString,(Character home asString)