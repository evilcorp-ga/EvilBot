accessing
processHelpCommandFor: aCommand to: aLoc
	aCommand asUppercase = 'WEATHER' ifTrue: [ self sendCommand: 'PRIVMSG ',aLoc,' :use !weather TwoLetterCountryCode (eg ZA), City Name' ].
	aCommand asUppercase = 'SEARCH' ifTrue: [ self sendCommand: 'PRIVMSG ',aLoc,' :use !search any search term' ].
	aCommand asUppercase = 'DICE' ifTrue: [ self sendCommand: 'PRIVMSG ',aLoc,' :use !dice to play a game. really simple. high number wins' ].
	aCommand asUppercase = 'TIME' ifTrue: [ self sendCommand: 'PRIVMSG ',aLoc,' :use !time TimeZone' ].
	aCommand asUppercase = 'LINKS' ifTrue: [ self sendCommand: 'PRIVMSG ',aLoc,' :use !links to get a list of useful links. Specific links are !wiki, !paste, !irc' ].
	aCommand asUppercase = 'CALC' ifTrue: [ self sendCommand: 'PRIVMSG ',aLoc,' :use !calc a maths problem eg: 1 + 1 * 2' ].