initialization
processPrivMsgCommandWith: anArray
		(((anArray first substrings: ' ') last) = self nick )
			ifTrue: [ self privateMsgFrom: anArray ]
			ifFalse:[
				((anArray at: 2) asUppercase includesSubstring: 'EVILBOT')
					ifTrue: [ ^self sendCommand: 'PRIVMSG ',((anArray first substrings: ' ') last),' :',self randomGreeting ].
				((anArray at: 2) beginsWith: '!')
					ifTrue: [ self processCommand: (anArray at: 2) withArray: anArray ]
			]