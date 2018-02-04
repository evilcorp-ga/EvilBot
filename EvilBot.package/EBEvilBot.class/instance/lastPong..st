initialization
lastPong: anArray
| aUser |
	aUser := (anArray first substrings: '!') first.
	self sendPrv: (aUser ,' PONG ',(Time now subtractTime: lastPong value) asSeconds asString,' seconds') to: lastPong key.
	