accessing
setupListFor: aDict on: stream
aDict keysAndValuesDo: [ :k :v | 
	stream nextPutAll: '<li>'; nextPutAll: k.
	stream nextPutAll: '<ul>'.
	v do: [ :loc |
		self pot GET: ('/evildb/',(loc at: '_key')) -> loc asWebForm.
		stream nextPutAll: '<li onclick="loadLocation(',(loc at: '_key'),')">';
		nextPutAll: (loc at: 'City name English');
		nextPutAll: '</li>' ].
	stream nextPutAll: '</ul>'
].