actions
startUp
	IceRepository allInstances do: [ :irp | 
	(irp name = 'EvilBot')
		ifTrue: [ 
			irp loadedPackages do: [ :pkg |
				pkg loadLatest ] ] ].
	self restore.
	Transcript crShow: 'Bot Data Restore'