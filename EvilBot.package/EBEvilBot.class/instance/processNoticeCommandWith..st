initialization
processNoticeCommandWith: anArray
		((anArray at: 2) beginsWith: 'This nickname is registered and protected.') |
		((anArray at: 2) beginsWith:'please choose a different nick')
			ifTrue: [
				self sendCommand: 'PRIVMSG nickserv identify ', self password.
				self sendCommand: 'JOIN #evilcorp'.
			]