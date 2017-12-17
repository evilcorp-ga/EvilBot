accessing
processCommand: aCmd withArray: anArray
	| aLoc |
	aLoc := ((anArray first substrings: ' ') last).
	(aCmd asUppercase beginsWith: '!WEATHER') ifTrue: [ self weatherCommand: aCmd withArray: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!SEARCH') ifTrue: [ self searchCommand: aCmd withArray: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!TIME') ifTrue: [ self processTimeCommand: aCmd withArray: anArray to: aLoc ].
	(aCmd asUppercase = '!SAVE') ifTrue: [ self processSaveCommand: anArray to: aLoc ].
	(aCmd asUppercase = '!QUIT') ifTrue: [ self processQuitCommand: aLoc with: anArray  ].
	(aCmd asUppercase = '!DICE') ifTrue: [ self processDiceCommand: aLoc ].
	(aCmd asUppercase beginsWith: '!HELP') ifTrue: [ self processHelpCommand: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!LINKS') ifTrue: [ self processLink: 'all' from: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!WIKI') ifTrue: [ self processLink: 'wiki' from: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!IRC') ifTrue: [ self processLink: 'irc' from: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!PASTE') ifTrue: [ self processLink: 'paste' from: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!PING') ifTrue: [ self processPingFrom: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!8BALL') ifTrue: [ self processEightBall: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!BUG') ifTrue: [ self processBugCommand: anArray to: aLoc ].
	(aCmd asUppercase = '!LISTBUGS') ifTrue: [ self processBugsCommand: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!CALC') ifTrue: [ self processCalcCommand: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!DATE') ifTrue: [ self processDateCommand: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!CURR') ifTrue: [ self processCurrancyCommand: anArray to: aLoc ]
	