accessing
searchCommand: aCmd withArray: anArray to: aLoc
	| aQuery |
	aQuery := (aCmd asUppercase copyReplaceAll: '!SEARCH ' with: '') asLowercase.
	self sendCommand: 'PRIVMSG ',aLoc,' :First 3 results for -> ', aQuery.
	(self getGoogleResultFor: aQuery) do: [ :e |
		self sendCommand: 'PRIVMSG ',aLoc,' :',e ]