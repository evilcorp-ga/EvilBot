initialization
getArrFrom: aLine
	| snd |
	snd := (aLine copyFrom: 2 to: aLine size) indexOfSubCollection: ':'.
	^snd > 1
		ifTrue: [
			Array
				with: (aLine copyFrom: 2 to: snd)
				with: (aLine copyFrom: (snd + 2) to: aLine size)
		]
		ifFalse: [ nil ]