rendering
clearLogButtonOn: html
	html button
		bePush;
		onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | 
			h form: [ h submitButton callback: [ EBEvilBot clearLog ]; with: 'Clear Log' ].
			h div id: 'logs'; with: [ EBEvilBot logs do: [ :e | html preformatted: e. ] ]]]);
		with: 'View Log'