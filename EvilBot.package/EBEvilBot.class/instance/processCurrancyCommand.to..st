accessing
processCurrancyCommand: anArray to: aLoc
| anArr res aData|
aData := self currancyData.
anArr := ((anArray at: 2) substrings: ' ') copyFrom: 2 to: ((anArray at: 2) substrings: ' ') size.
[ anArr last asNumber ] on: Error do: [ :ex | ^self sendCommand: 'PRIVMSG ',aLoc,' :Your mom' ].
(anArr first = 'USD') ifTrue: [ 
	res := (aData at: ((anArr first),(anArr second)) ifAbsent: [^self sendCommand: 'PRIVMSG ',aLoc,' :Your mom']) * (anArr last asNumber).
	^self sendCommand: 'PRIVMSG ',aLoc,' :',res asString
].
(anArr second = 'USD')
	ifTrue: [ res := ((aData at: ((anArr second),(anArr first)) ifAbsent: [^self sendCommand: 'PRIVMSG ',aLoc,' :Your mom'])) / (anArr last asNumber) ]
	ifFalse: [ | from to amount|
		from := 'USD',(anArr first).
		to := 'USD',(anArr second).
		amount := anArr last.
		res := ((aData at: to ifAbsent: [^self sendCommand: 'PRIVMSG ',aLoc,' :Your mom']) /
		(aData at: from ifAbsent: [^self sendCommand: 'PRIVMSG ',aLoc,' :Your mom']))
		* (anArr last asNumber)
		 ].
	self sendCommand: 'PRIVMSG ',aLoc,' :',res asString