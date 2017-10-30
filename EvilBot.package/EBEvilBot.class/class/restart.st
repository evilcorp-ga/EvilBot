accessing
restart
	| aPassword |
	aPassword := self default password.
	self quit.
	self start: aPassword