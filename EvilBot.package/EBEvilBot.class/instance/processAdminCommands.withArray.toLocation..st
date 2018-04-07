accessing
processAdminCommands: aCmd withArray: anArray toLocation: aLoc
	(self isAuthorized: anArray)
		ifTrue: [ | aCMD |
			aCMD := (aCmd substrings: ' ') first asUppercase.
			(aCMD asUppercase = 'ADMIN') ifTrue: [ self adminAddAdmin: aCmd withArray: anArray to: aLoc ].
			(aCMD asUppercase = 'AUTO') ifTrue: [ self adminAddAutoResponse: aCmd withArray: anArray to: aLoc ].
			(aCMD asUppercase = 'RESPONSE') ifTrue: [ self adminAddResponse: aCmd withArray: anArray to: aLoc ].
			(aCMD asUppercase = 'REMOVE') ifTrue: [ self adminRemove: aCmd withArray: anArray to: aLoc ].
			(aCMD asUppercase = 'LIST') ifTrue: [ self adminList: aCmd withArray: anArray to: aLoc ]
		]
		ifFalse: [ 
			( #('ADMIN' 'AUTO' 'RESPONSE' 'REMOVE') includes: (aCmd copyUpTo: (Character space)) asUppercase )
				ifTrue: [ self sendPrv: 'YOU NOT THE BOSS OF ME' to: aLoc ]
		]