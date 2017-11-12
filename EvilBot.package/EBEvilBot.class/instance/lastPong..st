initialization
lastPong: anArray
| aUser |
	aUser := (anArray first substrings: '!') first.
	self sendCommand: 'PRIVMSG ',lastPong key,' :',aUser ,' PONG ',(Time now subtractTime: lastPong value) asSeconds asString,' seconds'.
	