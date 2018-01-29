accessing
doesNotUnderstand: aMsg
	| compares aKey |
	compares := self properties keys collect: [ :e | 
	(e copyReplaceAll: ' ' with: '') asLowercase -> e].
	compares := compares asDictionary.
	aKey := compares at: aMsg asString ifAbsent: [aMsg asString].
	^self properties at: aKey ifAbsent: [ super doesNotUnderstand: aMsg ]