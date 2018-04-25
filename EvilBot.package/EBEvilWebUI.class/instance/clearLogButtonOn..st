rendering
clearLogButtonOn: html
	html button
		bePush;
		onClick: (html jQuery ajax callback: [ EBEvilBot clearLog ]);
		with: 'Clear Log'.