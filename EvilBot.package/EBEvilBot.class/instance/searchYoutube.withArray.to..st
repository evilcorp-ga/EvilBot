accessing
searchYoutube: aCmd withArray: anArray to: aLoc
	| aQuery |
	aQuery := (aCmd asUppercase copyReplaceAll: 'YOUTUBE ' with: '') asLowercase.
	self sendPrv: 'First 3 videos for -> ', aQuery to: aLoc.
	(self getGoogleResultFor: (aQuery,' site:youtube.com')) do: [ :e |
		e class = ByteString ifFalse: [  
		self sendPrv: ((e key),' -> ',(e value)) to: aLoc ]]