rendering
renderBotOn: html
	html form: [ 
		html unorderedList: [ 
			html listItem: [ self startBotOn: html ].
			html listItem: [ self saveButtonOn: html ].
			html listItem: [ self restoreButtonOn: html ].
			html listItem: [ self clearLogButtonOn: html].
			html listItem: [ html submitButton
			callback: [ EBEvilBot restart ];
			with: 'Restart the Bot'. ]
		].
	 ]