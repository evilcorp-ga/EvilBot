accessing
processBugCommand: anArray to: aLoc
	(anArray first beginsWith: 'georoot!georoot@da.cop')|
	(anArray first beginsWith: 'dusty!dusty@evilcorp.ga') |
	(anArray first beginsWith: 'Raikou!Raikou@The.Beast')
		ifTrue: [ 	| aUser aBug |
			aUser := (anArray first substrings: '!') first.
			aBug := (anArray last copyFrom: 5 to: (anArray last size)) trimBoth.
			self fileBug: (aUser -> aBug).
			self sendCommand: 'PRIVMSG ',aLoc,' :Bug Filed' ]
		ifFalse: [ 
			self sendCommand: 'PRIVMSG ',aLoc,' :Who are you?' ]