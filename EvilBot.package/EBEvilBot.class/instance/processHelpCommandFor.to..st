accessing
processHelpCommandFor: aCommand to: aLoc
	aCommand asUppercase = 'WEATHER' ifTrue: [ self sendPrv: 'use weather TwoLetterCountryCode (eg ZA), City Name' to: aLoc].
	aCommand asUppercase = 'SEARCH' ifTrue: [ self sendPrv: 'use search any search term' to: aLoc].
	aCommand asUppercase = 'YOUTUBE' ifTrue: [ self sendPrv: 'like search but for youtube.com' to: aLoc].
	aCommand asUppercase = 'DICE' ifTrue: [ self sendPrv: 'use dice to play a game. really simple. high number wins' to: aLoc].
	aCommand asUppercase = 'TIME' ifTrue: [ self sendPrv: 'use time TimeZone' to: aLoc].
	aCommand asUppercase = 'LINKS' ifTrue: [ self sendPrv: 'use links to get a list of useful links. Specific links are wiki, paste, irc, and forum' to: aLoc].
	aCommand asUppercase = 'CALC' ifTrue: [ self sendPrv: 'use calc to solve maths problems eg: 1 + 1 * 2' to: aLoc].