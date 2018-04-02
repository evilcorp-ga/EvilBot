accessing
adminRemove: aCmd withArray: anArray to: aLoc
	| arr aList aValue anIndex|
	arr := aCmd substrings: ' '.
	aList := arr second asUppercase.
	aValue := arr third.
	anIndex := arr at: 4 ifAbsent: [ nil ].
	aList = 'RESPONSE' ifTrue: [ self responses removeKey: aValue ifAbsent: [  ] ].
	aList = 'ADMIN' ifTrue: [ self authorizedUsers remove: aValue ifAbsent: [  ] ].
	aList = 'AUTO' ifTrue: [ 
		anIndex isNil 
			ifTrue: [ self autoResponses removeKey: aValue ifAbsent: [  ] ]
			ifFalse: [ (self autoResponses at: aValue) removeIndex: anIndex asNumber]
	].
		
	self sendPrv: (aValue,' has been removed from ',aList asLowercase) to: aLoc