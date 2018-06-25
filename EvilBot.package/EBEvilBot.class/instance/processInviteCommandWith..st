initialization
processInviteCommandWith: anArray
	| aChan |
	aChan := anArray last.
	aChan isEmptyOrNil ifTrue: [ ^nil ].
	aChan first = $# ifFalse: [ ^nil ].
	aChan := (((anArray at: 2) copyWithout: $#) asLowercase asSymbol).
	(self channels includes: aChan ) ifFalse: [ self channels add: aChan]