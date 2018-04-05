initialization
processAutomatedResponsesFrom: anArray
| aNick aLoc |
	( #('ADMIN' 'AUTO' 'RESPONSE' 'REMOVE' 'LIST') includes: ((anArray at: 2) copyUpTo: (Character space)) asUppercase )
		ifTrue: [ ^nil ].
	aLoc := ((anArray first substrings: ' ') last).
	aNick := [((anArray first substrings: '!') first)] on: Error do: [ :ex | 'Hey You' ].
	self autoResponses keysAndValuesDo: [ :k :v |
		((anArray at: 2) asUppercase includesSubstring: k asUppercase)
			ifTrue: [ 
				| aRes anAuto |
				v isEmpty ifFalse: [
					anAuto := v at: ((Random new) nextInt: (v size)).
					aRes := anAuto copyReplaceAll: '$nick' with: aNick.
					aRes := aRes copyReplaceAll: '$chan' with: aLoc.
					self sendPrv: aRes to: aLoc ] ]
		 ].