rendering
renderTalkFormOn: html
	| aChan aText |
	html form: [ 
		html select 
			list: (EBEvilBot default channels);
			callback: [ :val | aChan := val ].
		html textInput placeholder: 'say something'; callback: [ :val | aText := val ].
		html submitButton
			callback: [ EBEvilBot default sendPrv: aText to: ('#',aChan) ];
			with: 'Say' ]