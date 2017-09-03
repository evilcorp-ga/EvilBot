accessing
quit
	[self allInstancesDo: [ :e | 
		e sendCommand: 'QUIT help! I''m melting!'.
		e socketStream close]] on: Error do: [].
	default := nil