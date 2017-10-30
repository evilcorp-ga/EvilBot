initialization
setupCommandFiltering
	[
		[socketStream isConnected] whileTrue: [ | anArr textArr aCmd aLine |
			aLine := [socketStream nextLine] on: ConnectionClosed do: [self class restart].
			(aLine beginsWith: 'PING') 
				ifTrue: [ self sendCommand: 'PONG' ]
				ifFalse: [  
					self log: aLine.
					anArr := aLine substrings: ' '.
					textArr := aLine substrings: ':'.
					anArr size > 1 ifTrue: [ aCmd := anArr at: 2 ] ifFalse: [ aCmd := 0 ].
					self processCommand: aCmd from: textArr.
				].
		]
	] fork.