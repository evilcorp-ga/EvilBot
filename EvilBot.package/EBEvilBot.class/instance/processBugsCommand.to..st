accessing
processBugsCommand: anArray to: aLoc
	(anArray first beginsWith: 'georoot!georoot@da.cop')|
	(anArray first beginsWith: 'dusty!dusty@evilcorp.ga') |
	(anArray first beginsWith: 'Raikou!Raikou@The.Beast')
		ifTrue: [ 	| aUser |
			aUser := (anArray first substrings: '!') first.
			bugs do: [ :e | 
				self sendCommand: 'PRIVMSG ',aUser,' :', e asString
			]]