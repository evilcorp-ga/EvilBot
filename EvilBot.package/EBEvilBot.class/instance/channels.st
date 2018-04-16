accessing
channels
	^ channels ifNil: [ self channels: self class defaultchannels. channels ]