accessing
quit
	self allInstancesDo: [ :e | e quit].
	default := nil