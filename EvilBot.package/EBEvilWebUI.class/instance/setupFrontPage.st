accessing
setupFrontPage
	| stream aDict |
	stream := WriteStream on: ''.
	aDict := OrderedDictionary new.
	EBEvilDB default data do: [ :loc | 
		(aDict at: (loc at: 'Country name English') ifAbsentPut: [OrderedCollection new]) add: loc
	].
	self loadScriptOn: stream.
	self loadStyleOn: stream.
	stream nextPutAll: '<div id="list">'.
	stream nextPutAll: '<ul>'.
	self setupListFor: aDict on: stream.
	stream nextPutAll: '</ul>'.
	stream nextPutAll: '</div><div id="data">'.
	stream nextPutAll: '</div>'.
	self pot GET: '/evildb' -> stream contents.
	self pot start.
	