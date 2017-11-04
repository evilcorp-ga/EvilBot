accessing
processLink: linkset from: anArray to: aLoc
	self linkSet keysAndValuesDo: [ :k :v |
		Transcript crShow: linkset.
		(k = linkset | (linkset = 'all'))
			ifTrue: [ v do: [ :link |
					self sendCommand: 'PRIVMSG ',aLoc,' :',link ] ] ]