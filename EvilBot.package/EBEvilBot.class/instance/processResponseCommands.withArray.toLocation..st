accessing
processResponseCommands: aCmd withArray: anArray toLocation: aLoc
	self responses keysAndValuesDo: [ :k :v  |
		(aCmd asUppercase beginsWith: k asUppercase)
			ifTrue: [ self sendPrv: v to: aLoc ] ].
	