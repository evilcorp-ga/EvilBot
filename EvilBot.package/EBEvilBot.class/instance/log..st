accessing
log: aString
	Smalltalk isHeadless
		ifTrue: [ Transcript crShow: aString ]
		ifFalse: [
			Transcript crShow: aString.
			"self log nextPutAll: aString; crlf."
		]