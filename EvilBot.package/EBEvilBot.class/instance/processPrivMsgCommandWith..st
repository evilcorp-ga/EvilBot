initialization
processPrivMsgCommandWith: anArray
		(((anArray first substrings: ' ') last) = self nick )
			ifTrue: [ self privateMsgFrom: anArray ]
			ifFalse:[
				((anArray at: 2) asUppercase includesSubstring: (self nick asUppercase))
					ifTrue: [ self sendPrv: self randomGreeting to: ((anArray first substrings: ' ') last)].
				((anArray at: 2) asUppercase includesSubstring: 'C++')
					ifTrue: [ self sendPrv: '"c++ is to c what brain damage is to a brain" -moth' to: ((anArray first substrings: ' ') last)].
				((anArray at: 2) asUppercase includesSubstring: 'KEK')
					ifTrue: [ self sendPrv: 'STOP THAT! use lol instead' to: ((anArray first substrings: ' ') last)].
				(self isValidUrl: (anArray at: 2)) ifTrue: [ self sendLinkDesc: (anArray at: 2) to: ((anArray first substrings: ' ') last) ].
				self processCommand: (anArray at: 2) withArray: anArray
			]