rendering
renderWeatherDataFor: country on: html
((EBEvilDB default dataAsHierarchy at: country)
	asSortedCollection: [ :a :b | (b at: 'City name English') > (a at: 'City name English') ]) do: [ :col |
		html listItem 
			onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | self renderWeatherFormFor: col on: h ]]);
			with: [ html text: (col at: 'City name English')]
	]