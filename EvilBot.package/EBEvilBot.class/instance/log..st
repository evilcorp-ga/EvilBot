accessing
log: aString
	(self class logs at: Date today ifAbsentPut: [ OrderedCollection new ]) add: aString