accessing
returnCity: aCityName inCountry: aCountryName
	| aCol |
	aCol := self data select: [ :e | 
		(e at: 'Country name English') = aCountryName &
		(e at: 'City name English') = aCityName ].
	aCol isEmpty
		ifFalse: [ ^aCol first ].
	^nil