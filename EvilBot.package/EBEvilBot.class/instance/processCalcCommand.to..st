accessing
processCalcCommand: anArray to: aLoc
	| aCalc result|
	(anArray last size < 7) ifTrue: [ ^nil ].
	aCalc := (anArray last copyFrom: 7 to: (anArray last size)) trimBoth.
	result := [Compiler evaluate: aCalc] on: Exception do: [ :ex | 'Your mom' ].
	result class = Fraction ifTrue: [ result := result asFloat ].
	(result isKindOf: Magnitude) ifFalse: [ result := 'Your mom' ].
	self sendCommand: 'PRIVMSG ',aLoc,' :',aCalc,' = ',result asString.