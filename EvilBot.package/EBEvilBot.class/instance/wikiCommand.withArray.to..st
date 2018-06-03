accessing
wikiCommand: aCmd withArray: anArray to: aLoc
	| aQuery aDone |
	aDone := Set new.
	aQuery := (aCmd asUppercase copyReplaceAll: 'SEARCH ' with: '') asLowercase.
	(self getGoogleResultFor: aQuery) do: [ :e |
		(e asString includesSubstring: 'wikipedia')
			ifTrue: [
				(aDone includes: e value)
					ifFalse: [
						aDone add: e value.
						e class = ByteString
							ifTrue: [ self sendPrv: e to: aLoc ]
							ifFalse: [ self sendPrv: (e key),' -> ',(e value) to: aLoc ]
					]
			 ]
	]
