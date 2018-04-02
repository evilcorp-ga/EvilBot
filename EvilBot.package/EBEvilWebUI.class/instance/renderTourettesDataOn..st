rendering
renderTourettesDataOn: html
	self currancy: 'tourettes'.
	html unorderedList: [ 
		EBEvilDB default tourettes do: [ :e | 
			html listItem
				onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | h text: 'no can edit ',e ]]);
				with: [ html text: e ]
	].
	html button 
		onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | self renderTourettesForumOn: h ]]);
		with: 'New']