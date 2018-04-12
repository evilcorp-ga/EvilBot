accessing
processTimeCommand: aCmd withArray: anArray to: aLoc
	| aTimeZone aZones aTimes |
	(anArray last substrings: ' ') size = 1
		ifTrue: [ self sendPrv: 'UTC -> ',Time nowUTC printString to: aLoc]
		ifFalse: [ 
			aTimeZone := aCmd asUppercase copyReplaceAll: 'TIME' with: ''.
			aTimeZone := aTimeZone trimBoth.
			aZones := EBEvilDB default getOffsetsFor: aTimeZone.
			aZones isEmpty ifTrue: [ 
				aTimes := EBEvilDB default getTimeZoneByCityName: aTimeZone.
				aTimes do: [ :e |
					self sendPrv: e key,' -> ',e value printString to: aLoc
				]
			].
			aZones do: [ :e | | aTime |
				aTime := self getTimeInZone: (e at: 'Offset') for: nil.
				self sendPrv: (e at: 'Location'),' ',aTime printString to: aLoc
			]
		].