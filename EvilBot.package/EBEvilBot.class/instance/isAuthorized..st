initialization
isAuthorized: anArray
	self authorizedUsers do: [ :e | 
		(anArray first beginsWith: e)
			ifTrue: [ ^true ]
	].
	^false