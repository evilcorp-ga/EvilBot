initialization
processPrivMsgCommandWith: anArray
		(((anArray first substrings: ' ') last) = self nick )
			ifTrue: [ self privateMsgFrom: anArray ]
			ifFalse:[
				((anArray at: 2) asUppercase includesSubstring: (self nick asUppercase))
					ifTrue: [ ^self sendCommand: 'PRIVMSG ',((anArray first substrings: ' ') last),' :',self randomGreeting ].
				((anArray at: 2) beginsWith: '!')
					ifTrue: [ self processCommand: (anArray at: 2) withArray: anArray ].
				((anArray at: 2) asUppercase includesSubstring: 'C++')
					ifTrue: [ ^self sendCommand: 'PRIVMSG ',((anArray first substrings: ' ') last),' :c++ is to c what brain damage is to a brain' ]
			]