initialization
lastPong: anArray
| aUser |
	aUser := (anArray first substrings: '!') first.
	lastPong inspect.
	self sendCommand: 'PRIVMSG ',lastPong key,' :',aUser ,' PONG ',(Time now subtractTime: lastPong value) asSeconds asString,' seconds'.
	