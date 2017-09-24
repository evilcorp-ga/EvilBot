accessing
sendCityHelpCommandFor: aLoc cities: opt
| aParser aSt|
	socketStream sendCommand: 'PRIVMSG ',aLoc,' Valid cities are: ' .
	aParser := NeoCSVWriter on: (aSt := WriteStream on: '').
	aParser nextPut: opt asOrderedCollection.
	socketStream sendCommand: 'PRIVMSG ',aLoc,' ',((aSt contents copyReplaceAll: (String crlf asString) with: '') ifEmpty: ['Nothing']).