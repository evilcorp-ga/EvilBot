accessing
processHelpCommand: anArray to: aLoc
	(anArray second substrings: ' ') size = 1
		ifTrue: [ self sendCommand: 'PRIVMSG ',aLoc,' :Commands are !help, !weather, !search, !dice, !time, !ping, !8ball, !links, !wiki, !paste, !irc, !calc' ]
		ifFalse: [ 
			self processHelpCommandFor: (anArray second substrings: ' ') second to: aLoc]