initialization
setupCommandFiltering
	[ [ socketStream isConnected ]
		whileTrue: [ | anArr textArr aCmd aLine |
			aLine := [ socketStream nextLine ]
				on: ConnectionClosed
				do: [ self class restart ].
			aLine = EBEvilBot
				ifFalse: [  
			(aLine beginsWith: 'PING')
				ifTrue: [ 
					self channels do: [ :e | self sendCommand: 'JOIN #',e ].
					self sendCommand: 'PONG' ]
				ifFalse: [ 
					aLine := [ aLine asByteArray utf8Decoded ] on: Error do: [:ex | aLine := aLine ].
					self log: aLine.
					anArr := aLine substrings: ' '.
					textArr := self getArrFrom: aLine.
					aCmd := anArr size > 1
						ifTrue: [ anArr at: 2 ]
						ifFalse: [ 0 ].
					self processCommand: aCmd from: textArr ] ] ] ] fork