accessing
processAdminCommands: aCmd withArray: anArray toLocation: aLoc
	(self isAuthorized: anArray)
		ifTrue: [
			(aCmd asUppercase beginsWith: 'ADMIN') ifTrue: [ self adminAddAdmin: aCmd withArray: anArray to: aLoc ].
			(aCmd asUppercase beginsWith: 'AUTO') ifTrue: [ self adminAddAutoResponse: aCmd withArray: anArray to: aLoc ].
			(aCmd asUppercase beginsWith: 'RESPONSE') ifTrue: [ self adminAddResponse: aCmd withArray: anArray to: aLoc ].
		]
		ifFalse: [ self sendPrv: 'You''re not the boss of me!' to: aLoc ]