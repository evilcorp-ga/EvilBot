accessing
propertyAt: aKey
	^self properties at: aKey ifAbsent: [ nil ]