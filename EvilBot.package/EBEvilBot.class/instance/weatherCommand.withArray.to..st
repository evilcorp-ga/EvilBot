accessing
weatherCommand: aCmd withArray: anArray to: aLoc
		| arr aCountry opt aCity|
		arr := aCmd substrings: ' '.
		arr size > 1 ifTrue: [ aCountry := (arr at: 2) trimBoth copyFrom: 1 to: 2].
		arr := aCmd substrings: ','.
		arr size > 1 ifTrue: [ aCity := (arr at: 2) trimBoth ].
		aCountry isNil ifTrue: [ ^self sendPrv: 'Enter a TWO LETTER Country Code (eg, US, IN, ZA)' to: aLoc].
		aCity isNil 
		ifTrue: [  
			opt := ((EBEvilDB default data select: [ :e | (e at: 'Country code') = aCountry asUppercase]) collect: [ :e | e at: 'City name' ]) asSet asOrderedCollection.
			self sendPrv: 'use weather TwoLetterCountryCode (eg ZA), City Name' to: aLoc.
			self sendCityHelpCommandFor: aLoc cities: opt country: (EBEvilDB default countryNameForCode: aCountry).
		]
		ifFalse: [
			|weather|
			opt := ((EBEvilDB default data select: [ :e | 
				((e at: 'Country code') asUppercase = aCountry asUppercase) & 
				(e at: 'City name') asUppercase = aCity asUppercase]) asSet asOrderedCollection).
			opt isEmpty ifTrue: [^self sendPrv: 'Sorry, I don''t have that information :(' to: aLoc] ifFalse: [ opt := opt first ].
			weather := self getWeatherFor: (opt at: 'XML' ifAbsent: [ '' ]).
			self returnWeather: aLoc for: weather contents.
			 ]