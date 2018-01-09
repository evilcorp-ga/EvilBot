accessing
quit
	self allInstancesDo: [ :e | e quit].
	self reset.