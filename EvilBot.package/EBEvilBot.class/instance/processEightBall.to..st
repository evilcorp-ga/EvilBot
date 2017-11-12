accessing
processEightBall: anArray to: aLoc
| anAnswer aUser |
aUser := (anArray first substrings: '!') first.

anAnswer := (anArray last substrings: ' ') size = 1
	ifTrue: [ anAnswer := 'Try asking a question']
	ifFalse: [(EBEvilDB default eightBall) at: (Random new nextInt: (EBEvilDB default eightBall) size)].
self sendCommand: 'PRIVMSG ',aLoc,' :',aUser,', ',anAnswer.