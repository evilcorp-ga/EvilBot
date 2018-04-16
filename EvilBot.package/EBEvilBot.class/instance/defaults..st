accessing
defaults: aPass
	self password: aPass.
	self setKeys.
	self desc: (self class defaultdesc).
	self nick: self nick.
	self host: (self class defaulthost).
	self port: 6667.
	socketStream := SocketStream openConnectionToHostNamed: self host port: self port.
	socketStream noTimeout.
	socketStream autoFlush.
	self log: socketStream nextLine.
	self log: socketStream nextLine.
	socketStream sendCommand: 'USER ',self nick,' ',self nick,' ',self nick,': I am EVIL'.
	socketStream sendCommand: 'NICK ',self nick.
	socketStream flush.
	self setupCommandFiltering.
	
