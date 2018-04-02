rendering
renderAutoResponseFormFor: key on: html
	html form id: 'autoresponse'; class: 'responses'; with: [
		html submitButton with: 'Save'.
		html submitButton callback: [(EBEvilDB default autoResponses removeKey: key ifAbsent: [])]; with: 'Delete'.
		html break.
		html text: key.
		html break.
		(EBEvilDB default autoResponses at: key) do: [ :response | | anInput |
			anInput := html nextId.
			html textInput
				id: anInput;
				callback: [:val | 
					(EBEvilDB default autoResponses at: key) replaceAll: response with: val ];
				with: ([response asByteArray utf8Decoded]
				on: Error do: [ :ex | response ]).
			html button 
				bePush; 
				onClick: (html jQuery ajax script: [:s | 
					(EBEvilDB default autoResponses at: key) remove: response ifAbsent: [].
					s << (s jQuery id: anInput) remove
				]);
				onClick: (html jQuery this) remove;
				with: 'Delete'
		].
	].
	html button 
		bePush;
		onClick: ((html jQuery: '#autoresponse') append: [ :h | 
			h textInput callback: [:val | (EBEvilDB default autoResponses at: key) add: val]]); 
		with: 'add'.