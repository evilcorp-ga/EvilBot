initialization
processAutomatedResponsesFrom: anArray
	self autoResponses keysAndValuesDo: [ :k :v |
		((anArray at: 2) asUppercase includesSubstring: k asUppercase)
			ifTrue: [ self sendPrv: v to: ((anArray first substrings: ' ') last) ]
		 ].