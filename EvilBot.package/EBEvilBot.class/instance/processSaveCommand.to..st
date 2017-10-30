accessing
processSaveCommand: anArray to: aLoc
		Smalltalk saveSession.
		self sendCommand: 'PRIVMSG ',aLoc,' :I did a SAVE! 8-D'