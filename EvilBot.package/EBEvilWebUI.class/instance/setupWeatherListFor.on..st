accessing
setupWeatherListFor: aDict on: stream
aDict keysAndValuesDo: [ :k :v | 
	stream nextPutAll: '<li class="country"><span onclick="showcities(this);">+</span>'; nextPutAll: k.
	stream nextPutAll: '<ul class="hidden">'.
	v do: [ :loc |
		stream nextPutAll: '<li onclick="loadLocation(',(loc at: '_key'),')">';
		nextPutAll: (loc at: 'City name English');
		nextPutAll: '</li>' ].
	stream nextPutAll: '</ul>'
].