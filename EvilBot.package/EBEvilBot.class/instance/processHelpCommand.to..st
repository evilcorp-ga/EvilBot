accessing
processHelpCommand: anArray to: aLoc
	(anArray second substrings: ' ') size = 1
		ifTrue: [ self sendPrv: 'Commands are help, weather, search, youtube, dice, time, ping, 8ball, calc' to: aLoc]
		ifFalse: [ 
			self processHelpCommandFor: (anArray second substrings: ' ') second to: aLoc]