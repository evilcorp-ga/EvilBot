accessing
processTimeCommand: aCmd withArray: anArray to: aLoc
	| aTimeZone aZones |
	(anArray last substrings: ' ') size = 1
		ifTrue: [ self sendPrv: 'UTC -> ',Time nowUTC printString to: aLoc]
		ifFalse: [ aTimeZone := (anArray last substrings: ' ') last asUppercase.
			aZones := EBEvilDB default getOffsetsFor: aTimeZone.
			aZones do: [ :e | | aTime |
				aTime := self getTimeInZone: (e at: 'Offset') for: nil.
				self sendPrv: (e at: 'Location'),' ',aTime printString to: aLoc
			]
		].