accessing
processTimeCommand: aCmd withArray: anArray to: aLoc
	| aTimeZone aZones |
	(anArray last substrings: ' ') size = 1
		ifTrue: [ self sendCommand: 'PRIVMSG ',aLoc,' :UTC -> ',Time nowUTC printString ]
		ifFalse: [ aTimeZone := (anArray last substrings: ' ') last asUppercase.
			aZones := EBEvilDB default getOffsetsFor: aTimeZone.
			aZones do: [ :e | | aTime |
				aTime := self getTimeInZone: (e at: 'Offset') for: nil.
				self sendCommand: 'PRIVMSG ',aLoc,' :',(e at: 'Location'),' ',aTime printString
			]
		].