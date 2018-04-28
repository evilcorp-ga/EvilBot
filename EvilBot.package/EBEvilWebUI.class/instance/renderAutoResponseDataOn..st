rendering
renderAutoResponseDataOn: html
	self currancy: 'autoresponse'.
	html unorderedList: [
		EBEvilDB default autoResponses keys asSortedCollection do: [ :k |
			html listItem
				onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | self renderAutoResponseFormFor: k on: h ]]);
				with: [ html text: k ]
			].
		html button 
			onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | self renderNewAutoResponseFormOn: h ]]);
			with: 'New'
		]