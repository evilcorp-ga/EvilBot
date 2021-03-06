accessing
adminAddAutoResponse: aCmd withArray: anArray to: aLoc
	| arr aKey aValue str |
	arr := aCmd substrings: ' '.
	str := WriteStream on: ''.
	arr size < 2 ifTrue: [ ^nil ].
	aKey := arr at: 2.
	arr doWithIndex: [ :e :i |
		i > 2
			ifTrue: [ str := str nextPutAll: e; space ]
	].
	aValue := str contents trimBoth.
	(self autoResponses at: aKey ifAbsentPut: [ OrderedCollection new ]) add: aValue.
	self sendPrv: (aKey,' has been added to auto response list') to: aLoc