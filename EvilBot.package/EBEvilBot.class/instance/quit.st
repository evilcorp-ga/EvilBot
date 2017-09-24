accessing
quit
	socketStream isConnected 
		ifTrue: [ 
			socketStream sendCommand: 'QUIT I''m Melting'.
			socketStream flush; close.
		]
	