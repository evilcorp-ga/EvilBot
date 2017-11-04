accessing
processSaveCommand: anArray to: aLoc
	(anArray first beginsWith: 'georoot!georoot@da.cop')
		ifTrue: [ self sendCommand: 'PRIVMSG ',aLoc,' :wee woo wee woo' ]
		ifFalse: [  
	(anArray first beginsWith: 'dusty!dusty@evilcorp.ga')
			ifTrue: [
				Smalltalk saveSession.
				self sendCommand: 'PRIVMSG ',aLoc,' :I did a SAVE! 8-D']
			ifFalse: [self sendCommand: 'PRIVMSG ',aLoc,' :You''re not the boss of me!']]