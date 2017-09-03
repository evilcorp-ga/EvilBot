accessing
sendCommand: aString
	self log: 'SENDING: ', aString utf8Encoded.
	self socketStream sendCommand: aString utf8Encoded