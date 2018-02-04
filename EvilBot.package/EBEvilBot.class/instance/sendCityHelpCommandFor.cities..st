accessing
sendCityHelpCommandFor: aLoc cities: opt
| aParser aSt|
	aParser := NeoCSVWriter on: (aSt := WriteStream on: '').
	aParser nextPut: opt asOrderedCollection.
	self sendPrv: 'Valid Cities are ',(((aSt contents copyReplaceAll: (String crlf asString) with: '') contractTo: 1500) asString) to: aLoc