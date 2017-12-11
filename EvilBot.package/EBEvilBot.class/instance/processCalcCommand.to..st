accessing
processCalcCommand: anArray to: aLoc
	| aCalc result|
	aCalc := (anArray last asUppercase copyReplaceAll: '!CALC' with: '') trimBoth.
	result := [Compiler evaluate: aCalc] on: Exception do: [ :ex | 'Your mom' ].
	result class = Fraction ifTrue: [ result := result asFloat ].
	(result isKindOf: Magnitude) ifFalse: [ result := 'Your mom' ].
	self sendCommand: 'PRIVMSG ',aLoc,' :',aCalc,' = ',result asString.