accessing
searchCommand: aCmd withArray: anArray to: aLoc
	| aQuery |
	aQuery := (aCmd asUppercase copyReplaceAll: '!SEARCH ' with: '') asLowercase.
	self sendPrv: 'First 3 results for -> ', aQuery to: aLoc.
	(self getGoogleResultFor: aQuery) do: [ :e |
		self sendPrv: (e key),' -> ',(e value) to: aLoc ]