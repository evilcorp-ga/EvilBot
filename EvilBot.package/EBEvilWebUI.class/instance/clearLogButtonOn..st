rendering
clearLogButtonOn: html
	html button
		bePush;
		onClick: (html jQuery ajax callback: [ EBEvilBot clearLog ]);
		with: 'Clear Log'.
	html button
		bePush;
		onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | h unorderedList: [ self renderLogLinesOn: h ]]]);
		with: 'View Log'