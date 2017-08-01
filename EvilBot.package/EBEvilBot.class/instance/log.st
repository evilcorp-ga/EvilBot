accessing
log
	^log ifNil: [ 
		log := Workspace openLabel: 'IRCLog'.
		log]