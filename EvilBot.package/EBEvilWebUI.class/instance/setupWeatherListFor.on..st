accessing
setupWeatherListFor: aDict on: stream
aDict keysAndValuesDo: [ :k :v | 
	stream nextPutAll: '<li>'; nextPutAll: k.
	stream nextPutAll: '<ul>'.
	v do: [ :loc |
		stream nextPutAll: '<li onclick="loadLocation(',(loc at: '_key'),')">';
		nextPutAll: (loc at: 'City name English');
		nextPutAll: '</li>' ].
	stream nextPutAll: '</ul>'
].