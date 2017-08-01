accessing
log: aString
	| contents |
	contents := self log contents.
	contents append: (aString asString copyReplaceAll: '''' with: '''''') surroundedBySingleQuotes,'.',String crlf.
	self log contents: contents.