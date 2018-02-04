accessing
processBugCommand: anArray to: aLoc
	(anArray first beginsWith: 'georoot!georoot@da.cop') |
	(anArray first beginsWith: 'dusty!dusty@evilcorp.ga') |
	(anArray first beginsWith: 'Raikou!Raikou@The.Beast')
		ifTrue: [ 	| aUser aBug |
			aUser := (anArray first substrings: '!') first.
			aBug := (anArray last copyFrom: 5 to: (anArray last size)) trimBoth.
			self fileBug: (aUser -> aBug).
			self sendPrv: 'Bug Filed' to: aLoc]
		ifFalse: [ 
			self sendPrv: 'Who are you?' to: aLoc]