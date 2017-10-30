accessing
sendCommand: aString
	self log: 'SENDING: ', aString utf8Encoded.
	socketStream sendCommand: aString utf8Encoded.