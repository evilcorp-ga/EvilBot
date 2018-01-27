accessing
sendCityHelpCommandFor: aLoc cities: opt country: aCollection 
| aParser aSt aCountry |
	aCollection isEmptyOrNil ifTrue: [ aCountry := 'NowhereLand' ] ifFalse: [ aCountry := aCollection first at: 'Country name English'].
	aParser := NeoCSVWriter on: (aSt := WriteStream on: '').
	aParser nextPut: opt asOrderedCollection.
	self sendCommand: 'PRIVMSG ',aLoc,' :Valid Cities for ',aCountry,' are ',(((aSt contents copyReplaceAll: (String crlf asString) with: '') contractTo: 1500) asString)