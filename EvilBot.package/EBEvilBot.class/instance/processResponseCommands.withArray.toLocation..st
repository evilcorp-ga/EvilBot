accessing
processResponseCommands: aCmd withArray: anArray toLocation: aLoc
	| aNick |
	aNick := [((anArray first substrings: '!') first)] on: Error do: [ :ex | 'Hey You' ].
	self responses keysAndValuesDo: [ :k :v  |
		(aCmd asUppercase beginsWith: k asUppercase)
			ifTrue: [ | aRes |
				aRes := v copyReplaceAll: '$nick' with: aNick.
				aRes := aRes copyReplaceAll: '$chan' with: aLoc.
				self sendPrv: aRes to: aLoc ]
			].
	