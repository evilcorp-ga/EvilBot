rendering
renderDBListOn: html
	html unorderedList: [ 
		html listItem 
			onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#list') html: [:h | self renderWeatherDataOn: h ]]);
			with: [ html text: 'Weather Data' ].
		html listItem 
			onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#list') html: [:h | self renderResponseDataOn: h ]]);
			with: [ html text: 'Response Data' ].
		html listItem 
			onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#list') html: [:h | self renderAutoResponseDataOn: h ]]);
			with: [ html text: 'Auto Response Data' ].
		html listItem 
			onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#list') html: [:h | self renderTourettesDataOn: h ]]);
			with: [ html text: 'Tourettes Data' ].
		html listItem 
			onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#list') html: [:h | h text: 'content']]);
			with: [ html text: 'Admins Data' ].
	]