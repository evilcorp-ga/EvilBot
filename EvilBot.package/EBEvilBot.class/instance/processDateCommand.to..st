accessing
processDateCommand: anArray to: aLoc
	| aCalc result|
	aCalc := (anArray last asUppercase copyReplaceAll: '!DATE' with: '') trimBoth asLowercase.
	aCalc := aCalc copyReplaceAll: 'asdate' with: 'asDate'.
	result := [Compiler evaluate: aCalc] on: Exception do: [ :ex | 'Your mom' ].
	(result isKindOf: Magnitude) ifFalse: [ result := 'Your mom' ].
	self sendCommand: 'PRIVMSG ',aLoc,' :',aCalc,' = ',result asString.