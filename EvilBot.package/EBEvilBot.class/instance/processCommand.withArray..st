accessing
processCommand: aCmd withArray: anArray
	| aLoc |
	aLoc := ((anArray first substrings: ' ') last).
	self processCommand: aCmd withArray: anArray forLocation: aLoc