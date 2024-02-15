Class {
	#name : 'EBEvilBotMod',
	#superclass : 'Object',
	#instVars : [
		'location',
		'bot',
		'parameters',
		'response'
	],
	#category : 'EvilBot-Mods',
	#package : 'EvilBot-Mods'
}

{ #category : 'instance creation' }
EBEvilBotMod class >> new: aParam location: aLocation bot: aBot [
	^self new
		bot: aBot;
		parameters: aParam;
		location: aLocation;
		respond
]

{ #category : 'accessing' }
EBEvilBotMod >> bot [

	^ bot
]

{ #category : 'accessing' }
EBEvilBotMod >> bot: anObject [

	bot := anObject
]

{ #category : 'accessing' }
EBEvilBotMod >> location [

	^ location
]

{ #category : 'accessing' }
EBEvilBotMod >> location: anObject [

	location := anObject
]

{ #category : 'accessing' }
EBEvilBotMod >> parameters [

	^ parameters
]

{ #category : 'accessing' }
EBEvilBotMod >> parameters: anObject [

	parameters := anObject
]

{ #category : 'accessing' }
EBEvilBotMod >> respond [
	self bot sendPrv: self response to: self location
]

{ #category : 'accessing' }
EBEvilBotMod >> response [

	^ response
]

{ #category : 'accessing' }
EBEvilBotMod >> response: anObject [

	response := anObject
]
