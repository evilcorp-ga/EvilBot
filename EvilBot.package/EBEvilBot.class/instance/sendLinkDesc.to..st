initialization
sendLinkDesc: aLink to: aLoc
 | aUrl aTitle aLinkString |
	aLinkString := 
		(aLink includesSubstring: '.onion.to')
			ifTrue: [ aLink ]
			ifFalse: [ aLink copyReplaceAll: '.onion' with: '.onion.to' ].
	aUrl := ZnUrl fromString: aLinkString.
	[[aTitle := (((Soup fromString: aUrl retrieveContents) findTag: 'head') findTag: 'title') text.
	self sendPrv: aTitle to: aLoc] on: Error do: [ :ex | 
		self sendPrv: ex asString to: aLoc ]] fork