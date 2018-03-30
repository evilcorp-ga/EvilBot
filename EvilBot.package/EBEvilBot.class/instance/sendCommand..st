private protocol
sendCommand: aString
	[socketStream sendCommand: aString] on: Error do: [ :ex | socketStream sendCommand: aString utf8Encoded ].