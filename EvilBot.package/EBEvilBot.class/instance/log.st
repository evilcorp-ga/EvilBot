accessing
log
	^log ifNil: [ 
		Smalltalk isHeadless
			ifTrue: [ log := Workspace openLabel: 'IRCLog']
			ifFalse: [ log := '' ].
		log]