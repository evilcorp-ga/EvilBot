initialization
processQuitCommand: aLoc with: anArray 
	(self isAuthorized: anArray)
			ifTrue: [
				self sendCommand: 'PRIVMSG ',aLoc,' :Bye Bye :('.
				self quit.]
			ifFalse: [self sendCommand: 'PRIVMSG ',aLoc,' :You''re not the boss of me!']