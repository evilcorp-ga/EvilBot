Class {
	#name : 'EBEvilBotDice',
	#superclass : 'EBEvilBotMod',
	#category : 'EvilBot-Mods',
	#package : 'EvilBot-Mods'
}

{ #category : 'accessing' }
EBEvilBotDice class >> respondsToCommand: aCommand [
	^aCommand asUppercase = 'DICE'
]

{ #category : 'accessing' }
EBEvilBotDice >> processDice [
	| aDict aWinner aAll aWinners|
	aDict := Dictionary new.
	self bot sendCommand: 'NAMES ', self location.
	self bot names ifNotNil: [ :arr |
		arr do: [ :each | 
			(aDict at: (Random new nextInteger: arr size) ifAbsentPut: [ OrderedCollection new ]) add: each
		]
	].
aDict isEmpty ifFalse: [ aWinner := (aDict keys) max ].
aAll := String streamContents: [ :st | aDict keysAndValuesDo: [ :k :v | st nextPutAll: k asString,': '. v do: [ :e | st nextPutAll: e,' ' ] ] ].
aWinners := String streamContents: [ :st | st nextPutAll: 'Winners: '. (aDict at: aWinner ifAbsent: [ OrderedCollection with: 'duh you']) do: [ :v | st nextPutAll: v,' '] ].
response := aWinners.
self bot resetNames
]

{ #category : 'accessing' }
EBEvilBotDice >> respond [
	self processDice.
	super respond
]
