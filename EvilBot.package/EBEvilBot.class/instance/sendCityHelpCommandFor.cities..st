accessing
sendCityHelpCommandFor: aLoc cities: opt
| aParser aSt|
	self sendCommand: 'PRIVMSG ',aLoc,' Valid cities are: ' .
	aParser := NeoCSVWriter on: (aSt := WriteStream on: '').
	aParser nextPut: opt asOrderedCollection.
	self sendCommand: 'PRIVMSG ',aLoc,' ',((aSt contents copyReplaceAll: (String crlf asString) with: '') ifEmpty: ['Nothing']).