accessing
log: aString
	| contents |
	Smalltalk isHeadless
		ifTrue: [ Transcript crShow: aString ]
		ifFalse: [  
			contents := self log contents.
			contents append: (aString asString copyReplaceAll: '''' with: '''''') surroundedBySingleQuotes,'.',String crlf.
			self log contents: contents
		]