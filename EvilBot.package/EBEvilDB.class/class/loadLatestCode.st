actions
loadLatestCode
	IceRepository allInstances do: [ :irp |  (irp name = 'EvilBot') ifTrue: [  irp loadedPackages do: [ :pkg | pkg loadLatest ] ] ].
	Transcript crShow: 'Loaded Latest Bot Code'