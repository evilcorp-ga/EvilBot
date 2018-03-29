accessing
adminList: aCmd withArray: anArray to: aLoc
	| arr aList |
	arr := aCmd substrings: ' '.
	aList := arr last asUppercase.
	aList = 'ADMIN' ifTrue: [ self sendPrv: (self authorizedUsers asArray asString) to: aLoc ].
	aList = 'RESPONSE' ifTrue: [ self sendPrv: (self responses keys asString) to: aLoc ].
	aList = 'AUTO' ifTrue: [ self sendPrv: (self autoResponses keys asString) to: aLoc ].