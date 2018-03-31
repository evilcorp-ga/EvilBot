rendering
renderAutoResponseDataOn: html
	self currancy: 'autoresponse'.
	html unorderedList: [ 
		EBEvilDB default autoResponses keysDo: [ :k |
			html listItem
				onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | self renderAutoResponseFormFor: k on: h ]]);
				with: [ html text: k ]
			]
		]