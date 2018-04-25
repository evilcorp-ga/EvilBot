rendering
viewLogButtonOn: html
	html button
		bePush;
		onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | h unorderedList: [ self renderLogLinesOn: h ]]]);
		with: 'View Log'.
	html script: (
    ((html jQuery: '#logs') load
        html: [ :innerHtml | (EBEvilBot logs at: currLogLine ifAbsent: [OrderedCollection new]) reverse do: [:line | innerHtml preformatted: line] ]) 
            interval: 1000)