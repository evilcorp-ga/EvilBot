accessing
adminList: aCmd withArray: anArray to: aLoc
	| arr aList aSpec|
	arr := aCmd substrings: ' '.
	arr size < 2 ifTrue: [ ^nil ].
	aList := arr second asUppercase.
	aSpec := arr at: 3 ifAbsent: [nil].
	aList = 'ADMIN' ifTrue: [ self sendPrv: (self authorizedUsers asArray asString) to: aLoc ].
	aList = 'RESPONSE' ifTrue: [ self sendPrv: (self responses keys asString) to: aLoc ].
	aList = 'AUTO' ifTrue: [ 
		aSpec isNil
			ifTrue: [ self sendPrv: (self autoResponses keys asString) to: aLoc ]
			ifFalse: [ self sendPrv: (self autoResponses at: aSpec ifAbsent: [OrderedCollection new]) asArray asString to: aLoc ]
	]