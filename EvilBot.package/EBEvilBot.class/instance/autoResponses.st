accessing
autoResponses
	^autoResponses ifNil: [ autoResponses := self class defaultAutoResponses. autoResponses ]