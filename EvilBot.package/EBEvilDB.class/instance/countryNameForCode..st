accessing
countryNameForCode: aCode
	^self data select: [ :e | (e at: 'Country code') asUppercase = aCode asUppercase ]