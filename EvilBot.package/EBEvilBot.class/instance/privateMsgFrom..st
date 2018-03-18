accessing
privateMsgFrom: anArray
	|aUser aCmd |
	aUser := (anArray first substrings: '!') first.
	aCmd := anArray at: 2.
	self processCommand: aCmd withArray: anArray forLocation: aUser