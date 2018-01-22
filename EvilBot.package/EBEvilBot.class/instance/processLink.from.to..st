accessing
processLink: linkset from: anArray to: aLoc
	self linkSet keysAndValuesDo: [ :k :v |
		(k = linkset | (linkset = 'all'))
			ifTrue: [ | links |
				links := String streamContents: [ :st | 
					st nextPutAll: k.
					st nextPut: $:; space.
				v doWithIndex: [ :link :i |
					st nextPutAll: link.
					i = v size ifFalse: [ st nextPut: $, ].
					st space. ] 
				].
		self sendCommand: 'PRIVMSG ',aLoc,' :',links
	]].