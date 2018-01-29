accessing
pot
	^pot ifNil: [ 
		pot := Teapot configure: { #port -> 8081 }.
		pot ]