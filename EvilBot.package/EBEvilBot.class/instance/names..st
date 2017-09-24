accessing
names: aString 
	names := (aString substrings: ' ') collect: [ :e | e select: [ :c | c isAlphaNumeric | (c = $-) ] ].