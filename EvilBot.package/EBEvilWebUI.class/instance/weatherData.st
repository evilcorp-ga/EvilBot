accessing
weatherData
| stream aDict |
	stream := WriteStream on: ''.
	aDict := OrderedDictionary new.
	EBEvilDB default data do: [ :loc | 
		self pot GET: ('/evildb/',(loc at: '_key')) -> loc asWebForm.
		(aDict at: (loc at: 'Country name English') ifAbsentPut: [OrderedCollection new]) add: loc
	].
	self loadScriptOn: stream.
	self loadStyleOn: stream.
	stream nextPutAll: '<div id="list">'.
	stream nextPutAll: '<ul>'.
	self setupWeatherListFor: aDict on: stream.
	stream nextPutAll: '</ul>'.
	stream nextPutAll: '</div><div id="data">'.
	stream nextPutAll: '</div>'.
	^stream contents