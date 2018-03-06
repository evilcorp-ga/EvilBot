initialization
sendLinkDesc: aLink to: aLoc
 | aUrl aTitle |
	aUrl := ZnUrl fromString: aLink.
	[aTitle := (((Soup fromString: aUrl retrieveContents) findTag: 'head') findTag: 'title') text.
	self sendPrv: aTitle to: aLoc] on: Error do: [ :ex | 
		self sendPrv: ex asString to: aLoc ]