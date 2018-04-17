initialization
processJoinCommandWith: anArray
	| aUser  |
	anArray isEmptyOrNil ifTrue: [ ^nil ].
	(anArray first substrings: '!') isEmptyOrNil ifTrue: [ ^nil ].
	aUser := (anArray first substrings: '!') first.
	aUser = self nick 
		ifTrue: [ | aChan |
			aChan := (((anArray at: 2) copyWithout: $#) asLowercase asSymbol).
			(self channels includes: aChan ) ifFalse: [ self channels add: aChan] ]
		ifFalse: [ 
			self sendPrv: 'Welcome ', aUser to: (anArray at: 2) ]