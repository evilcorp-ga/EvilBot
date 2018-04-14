rendering
startBotOn: html
	| aNick aPass |
	html button
		bePush;
		onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | 
			h form: [ 
				h textInput placeholder: 'Nickname'; callback: [ :val | aNick := val ].
				h passwordInput placeholder: 'Password'; callback: [ :val | aPass := val ].
				h submitButton callback: [ EBEvilBot start: aPass nick: aNick ]; with: 'Start'
			].
		]]);
		with: 'New'