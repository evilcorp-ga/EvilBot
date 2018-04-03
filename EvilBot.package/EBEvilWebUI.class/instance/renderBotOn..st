rendering
renderBotOn: html
	html form: [ 
		html div
			onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | 
					h div id: 'logs'; with: [ EBEvilBot logs do: [ :e | html preformatted: e. ] ]]]);
			with: 'View Log'.
		html submitButton
			callback: [ EBEvilBot restart ];
			with: 'Restart the Bot'. ]