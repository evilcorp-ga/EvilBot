initialization
processQuitCommand: aLoc with: anArray 
(anArray first beginsWith: 'georoot!georoot@da.cop')
		ifTrue: [ self sendCommand: 'PRIVMSG ',aLoc,' :wee woo wee woo' ]
		ifFalse: [  
	(anArray first beginsWith: 'dusty!dusty@evilcorp.ga')
			ifTrue: [
				self sendCommand: 'PRIVMSG ',aLoc,' :Bye Bye :('.
				self quit.]
			ifFalse: [self sendCommand: 'PRIVMSG ',aLoc,' :You''re not the boss of me!']]