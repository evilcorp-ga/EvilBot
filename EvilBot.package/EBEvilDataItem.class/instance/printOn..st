accessing
printOn: aStream
	aStream nextPut: $(.
		self properties do: [:element | aStream print: element] separatedBy: [aStream space].
	aStream nextPut: $)