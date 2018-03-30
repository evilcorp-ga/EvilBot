accessing
quit
	socketStream isNil ifFalse: [
	socketStream isConnected 
		ifTrue: [ 
			socketStream sendCommand: 'QUIT I''m Melting'.
			socketStream flush; close.
		]
	]