accessing
channels
	^ channels ifNil: [ channels := self class defaultchannels. channels ]