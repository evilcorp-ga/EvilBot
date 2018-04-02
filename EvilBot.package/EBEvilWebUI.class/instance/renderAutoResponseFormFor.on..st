rendering
renderAutoResponseFormFor: key on: html
	html form class: 'responses'; with: [
		html text: key.
		html break.
		(EBEvilDB default autoResponses at: key) do: [ :response |
			html textInput: ([response asByteArray utf8Decoded]
				on: Error do: [ :ex | response ]) "delete button here"
		].
		"new entry here"
		"submit button here"
	]