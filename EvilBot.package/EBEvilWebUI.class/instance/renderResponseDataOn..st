rendering
renderResponseDataOn: html
	self currancy: 'response'.
	html unorderedList: [ 
		EBEvilDB default responses keys asSortedCollection do: [ :k |
			html listItem
				onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | self renderResponseFormFor: k on: h ]]);
				with: [ html text: k ]
			].
		html button 
			onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | self renderNewResponseFormOn: h ]]);
			with: 'New'
		]