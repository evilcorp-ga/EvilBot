accessing
processAdminCommands: aCmd withArray: anArray toLocation: aLoc
	(self isAuthorized: anArray)
		ifTrue: [
			(aCmd asUppercase beginsWith: 'ADMIN') ifTrue: [ self adminAddAdmin: aCmd withArray: anArray to: aLoc ].
			(aCmd asUppercase beginsWith: 'AUTO') ifTrue: [ self adminAddAutoResponse: aCmd withArray: anArray to: aLoc ].
			(aCmd asUppercase beginsWith: 'RESPONSE') ifTrue: [ self adminAddResponse: aCmd withArray: anArray to: aLoc ].
			(aCmd asUppercase beginsWith: 'REMOVE') ifTrue: [ self adminRemove: aCmd withArray: anArray to: aLoc ].
			(aCmd asUppercase beginsWith: 'LIST') ifTrue: [ self adminList: aCmd withArray: anArray to: aLoc ]
		]
		ifFalse: [ 
			( #('ADMIN' 'AUTO' 'RESPONSE' 'REMOVE') includes: (aCmd copyUpTo: (Character space)) asUppercase )
				ifTrue: [ self sendPrv: 'YOU NOT THE BOSS OF ME' to: aLoc ]
		]