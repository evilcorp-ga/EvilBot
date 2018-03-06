accessing
tourettesData
| stream aDict |
	stream := WriteStream on: ''.
	aDict := OrderedDictionary new.
	EBEvilDB default tourettes do: [ :rand | 
		stream nextPutAll: rand.
		stream nextPutAll: '<br />'.
	].
		stream nextPutAll: '<form method="post">
		<input name="value" type="text" />
		<input type="submit" value="Add" /></form>'.
	^stream contents