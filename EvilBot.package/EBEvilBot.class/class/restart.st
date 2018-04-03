accessing
restart
	| aPassword aNick |
	aPassword := self default password.
	aNick := self default nick.
	self quit.
	self start: aPassword nick: aNick