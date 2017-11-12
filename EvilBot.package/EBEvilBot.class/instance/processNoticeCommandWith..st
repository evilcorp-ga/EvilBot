initialization
processNoticeCommandWith: anArray
		((anArray at: 2) beginsWith: 'This nickname is registered and protected.') |
		((anArray at: 2) beginsWith:'please choose a different nick')
			ifTrue: [
				self sendCommand: 'PRIVMSG nickserv identify ', self password.
				self sendCommand: 'JOIN #evilcorp'.
			].
		((anArray at: 2) copyWithout: (Character home)) trimBoth = 'PING' ifTrue: [ self lastPong: anArray ].