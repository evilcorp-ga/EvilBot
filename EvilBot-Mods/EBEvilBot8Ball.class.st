Class {
	#name : 'EBEvilBot8Ball',
	#superclass : 'EBEvilBotMod',
	#classInstVars : [
		'Eightball'
	],
	#category : 'EvilBot-Mods',
	#package : 'EvilBot-Mods'
}

{ #category : 'as yet unclassified' }
EBEvilBot8Ball class >> eightBall [
^ Eightball ifNil: [Eightball := 'It is certain
It is decidedly so
Without a doubt
Yes definitely
You may rely on it
As I see it, yes
Most likely
Outlook good
Yes
Signs point to yes
Reply hazy try again
Ask again later
Better not tell you now
Cannot predict now
Concentrate and ask again
Don''t count on it
My reply is no
My sources say no
Outlook not so good
Very doubtful' substrings: (String crlf). Eightball]
]

{ #category : 'as yet unclassified' }
EBEvilBot8Ball class >> randomEightball [
 ^self eightBall at: (Random new nextInteger: (self eightBall size))
]

{ #category : 'accessing' }
EBEvilBot8Ball class >> respondsToCommand: aCommand [

	^aCommand asUppercase beginsWith: '8BALL'
]

{ #category : 'as yet unclassified' }
EBEvilBot8Ball >> processEightBall [
| anAnswer aUser |
aUser := (self parameters first substrings: '!') first.
anAnswer := (self parameters last substrings: ' ') size = 1
	ifTrue: [ anAnswer := 'Try asking a question']
	ifFalse: [self class randomEightball].
response := aUser,', ',anAnswer
]

{ #category : 'accessing' }
EBEvilBot8Ball >> respond [
	self processEightBall.
	super respond
]
