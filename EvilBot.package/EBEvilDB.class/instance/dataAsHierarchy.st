accessing
dataAsHierarchy
	| aDict |
	aDict := Dictionary new.
	self data do: [ :e |
		(aDict at: (e at: 'Country name') ifAbsentPut: [ OrderedCollection new ]) add: e ].
	^aDict