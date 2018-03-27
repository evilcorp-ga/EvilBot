accessing
processSaveCommand: anArray to: aLoc
	(self isAuthorized: anArray)
			ifTrue: [
				Smalltalk saveSession.
				self sendCommand: 'PRIVMSG ',aLoc,' :I did a SAVE! 8-D']
			ifFalse: [self sendCommand: 'PRIVMSG ',aLoc,' :You''re not the boss of me!']