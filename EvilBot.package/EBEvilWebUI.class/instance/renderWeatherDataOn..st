rendering
renderWeatherDataOn: html
	self currancy: 'weather'.
	html unorderedList: [
		(EBEvilDB default dataAsHierarchy keys asSortedCollection) do: [ :country | | anID |
			anID := html nextId.
			html listItem with: [
				html div
					onClick: ((html jQuery id: anID) toggle);
					onClick: (html jQuery ajax script: [:s | s << (html jQuery id: anID) html: [:h | self renderWeatherDataFor: country on: h ]]);
					with: [ html text: country].
				html unorderedList
					id: anID;
					class: 'cities'
			]
		].
	].
		html button 
			onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | self renderWeatherFormOn: h ]]);
			with: 'New'