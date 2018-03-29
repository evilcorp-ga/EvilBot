accessing
adminRemove: aCmd withArray: anArray to: aLoc
	| arr aList aValue |
	arr := aCmd substrings: ' '.
	aList := arr second asUppercase.
	aValue := arr last.
	aList = 'AUTO' ifTrue: [ self autoResponses removeKey: aValue ifAbsent: [  ] ].
	aList = 'RESPONSE' ifTrue: [ self responses removeKey: aValue ifAbsent: [  ] ].
	aList = 'ADMIN' ifTrue: [ self authorizedUsers remove: aValue ifAbsent: [  ] ]