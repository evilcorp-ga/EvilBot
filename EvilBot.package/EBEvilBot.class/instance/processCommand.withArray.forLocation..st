accessing
processCommand: aCmd withArray: anArray forLocation: aLoc

	(aCmd asUppercase beginsWith: 'WEATHER') ifTrue: [ self weatherCommand: aCmd withArray: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: 'SEARCH') ifTrue: [ self searchCommand: aCmd withArray: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: 'WIKI') ifTrue: [ self wikiCommand: aCmd withArray: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: 'YOUTUBE') ifTrue: [ self searchYoutube: aCmd withArray: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: 'TIME') ifTrue: [ self processTimeCommand: aCmd withArray: anArray to: aLoc ].
	(aCmd asUppercase = 'SAVE') ifTrue: [ self processSaveCommand: anArray to: aLoc ].
	(aCmd asUppercase = 'QUIT') ifTrue: [ self processQuitCommand: aLoc with: anArray  ].
	(aCmd asUppercase = 'DICE') ifTrue: [ self processDiceCommand: aLoc ].
	(aCmd asUppercase beginsWith: 'PING') ifTrue: [ self processPingFrom: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '8BALL') ifTrue: [ self processEightBall: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: 'CALC') ifTrue: [ self processCalcCommand: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: 'DATE') ifTrue: [ self processDateCommand: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: 'CURR') ifTrue: [ self processCurrancyCommand: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '?HELP') ifTrue: [ self processHelpCommand: anArray to: aLoc ].
	self processAdminCommands: aCmd withArray: anArray toLocation: aLoc.
	self processResponseCommands: aCmd withArray: anArray toLocation: aLoc
	