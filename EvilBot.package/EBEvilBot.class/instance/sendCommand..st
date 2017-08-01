accessing
sendCommand: aString
	self log: aString.
	self socketStream sendCommand: aString utf8Encoded