accessing
at: aKey ifAbsent: aBlock
	^(self propertyAt: aKey) ifNil: aBlock value