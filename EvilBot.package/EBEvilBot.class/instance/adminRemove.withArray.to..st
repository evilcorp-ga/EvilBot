accessing
adminRemove: aCmd withArray: anArray to: aLoc
	| arr aList aValue anIndex|
	arr := aCmd substrings: ' '.
	arr size < 3 ifTrue: [ ^'' ].
	aList := arr second asUppercase.
	aValue := arr third.
	anIndex := arr at: 4 ifAbsent: [ 'nil' ].
	anIndex := anIndex asInteger.
	aList = 'RESPONSE' ifTrue: [ 
		self sendPrv: ('Removing ',aValue,' from ', aList asLowercase) to: aLoc.
		self responses removeKey: aValue ifAbsent: [ 
			self sendPrv: (aValue,' doesn''t exist in ',aList asLowercase) to: aLoc] ].
	aList = 'ADMIN' ifTrue: [ 
		self sendPrv: ('Removing ',aValue,' from ', aList asLowercase) to: aLoc.
		self authorizedUsers remove: aValue ifAbsent: [ 
			self sendPrv: (aValue,' doesn''t exist in ',aList asLowercase) to: aLoc ] ].
	aList = 'AUTO' ifTrue: [ 
		anIndex isNil 
			ifTrue: [ 
					self sendPrv: ('Removing ',aValue,' from ', aList asLowercase) to: aLoc.
					self autoResponses removeKey: aValue ifAbsent: [ 
						self sendPrv: (aValue,' doesn''t exist in ',aList asLowercase) to: aLoc ] ]
			ifFalse: [ 
					self sendPrv: ('Removing ',anIndex asString,' from ',aValue,' in ', aList asLowercase) to: aLoc.
				(self autoResponses at: aValue ifAbsent: [OrderedCollection new]) size >= anIndex asInteger
					ifTrue: [ (self autoResponses at: aValue ifAbsent: [OrderedCollection new]) removeIndex: anIndex asNumber ]
					ifFalse: [ self sendPrv: (aValue,' doesn''t have an index of value ',anIndex asString,' in ',aList asLowercase) to: aLoc ] ]
	].