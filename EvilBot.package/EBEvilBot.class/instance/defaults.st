accessing
defaults
	channels := OrderedCollection with: #evilcorp.
	self setKeys.
	self desc: 'I am an Evil Bot'.
	self nick: 'EvilBot'.
	self host: 'irc.evilcorp.ga'.
	self port: 6667.
	socketStream := SocketStream openConnectionToHostNamed: self host port: self port.
	socketStream noTimeout.
	"socketStream autoFlush."
	self log: socketStream nextLine.
	self log: socketStream nextLine.
	self sendCommand: 'USER ',self nick,' ',self nick,' ',self nick,': I am EVIL'.
	self sendCommand: 'NICK ',self nick.
	self setupCommandFiltering.
