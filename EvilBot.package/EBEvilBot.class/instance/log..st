accessing
log: aString
	self class logs add: aString.
	Smalltalk isHeadless
		ifTrue: [ Transcript crShow: aString ]
		ifFalse: [
			Transcript crShow: aString.
			"self log nextPutAll: aString; crlf."
		]