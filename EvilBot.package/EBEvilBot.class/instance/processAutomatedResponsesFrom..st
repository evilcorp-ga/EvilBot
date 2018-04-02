initialization
processAutomatedResponsesFrom: anArray
| aNick aLoc |
	aLoc := ((anArray first substrings: ' ') last).
	aNick := [((anArray first substrings: '!') first)] on: Error do: [ :ex | 'Hey You' ].
	self autoResponses keysAndValuesDo: [ :k :v |
		((anArray at: 2) asUppercase includesSubstring: k asUppercase)
			ifTrue: [ 
				| aRes anAuto |
				anAuto := v at: ((Random new) nextInt: (v size)).
				aRes := anAuto copyReplaceAll: '$nick' with: aNick.
				aRes := aRes copyReplaceAll: '$chan' with: aLoc.
				self sendPrv: aRes to: aLoc ]
		 ].