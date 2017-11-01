accessing
weatherCommand: aCmd withArray: anArray to: aLoc
		| arr aCountry opt aCity|
		arr := aCmd substrings: ' '.
		arr size > 1 ifTrue: [ aCountry := (arr at: 2) trimBoth copyFrom: 1 to: 2].
		arr := aCmd substrings: ','.
		arr size > 1 ifTrue: [ aCity := (arr at: 2) trimBoth ].
		aCountry isNil ifTrue: [ ^self sendCommand: 'PRIVMSG ',aLoc,' :Enter a TWO LETTER Country Code (eg, US, IN, ZA)' ].
		aCity isNil 
		ifTrue: [  
			opt := ((EBEvilDB default data select: [ :e | (e at: 'Country code') = aCountry asUppercase]) collect: [ :e | e at: 'City name English' ]) asSet asOrderedCollection.
			self sendCommand: 'PRIVMSG ',aLoc,' :use !weather TwoLetterCountryCode (eg ZA), City Name'.
			self sendCityHelpCommandFor: aLoc cities: opt.
		]
		ifFalse: [
			|weather|
			opt := ((EBEvilDB default data select: [ :e | 
				((e at: 'Country code') asUppercase = aCountry asUppercase) & 
				(e at: 'City name English') asUppercase = aCity asUppercase]) asSet asOrderedCollection).
			opt isEmpty ifTrue: [^self sendCommand: 'PRIVMSG ',aLoc,' Thats weird!' ] ifFalse: [ opt := opt first ].
			weather := ZnEasy get: (opt at: 'Link to English-XML' ifAbsent: [ '' ]).
			self returnWeather: aLoc for: weather contents.
			 ]