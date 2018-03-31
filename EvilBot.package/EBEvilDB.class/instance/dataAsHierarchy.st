accessing
dataAsHierarchy
	| aDict |
	aDict := Dictionary new.
	self data values do: [ :e |
		(aDict at: (e at: 'Country name English') ifAbsentPut: [ OrderedCollection new ]) add: e ].
	^aDict