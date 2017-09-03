accessing
log
	^log ifNil: [ 
		log := WriteStream on: ''.
		log]