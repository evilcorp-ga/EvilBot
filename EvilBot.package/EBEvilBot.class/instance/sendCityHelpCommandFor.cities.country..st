accessing
sendCityHelpCommandFor: aLoc cities: aCities country: aCollection 

	(aLoc beginsWithSubCollection: '#')
		ifTrue: [ self sendPrv: 'Please ask me for valid cities in private' to: aLoc ]
		ifFalse: [ self sendCityHelpCommandForPrv: aLoc cities: aCities country: aCollection ]