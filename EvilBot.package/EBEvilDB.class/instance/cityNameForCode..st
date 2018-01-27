accessing
cityNameForCode: aCode
	^self data select: [ :e | (e at: 'Country Code') asUppercase = aCode asUppercase ]