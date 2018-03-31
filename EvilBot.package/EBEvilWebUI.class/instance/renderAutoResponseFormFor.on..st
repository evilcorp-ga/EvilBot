rendering
renderAutoResponseFormFor: key on: html
	html form class: 'responses'; with: [ 
		html textInput: key.
		html break.
		html textInput: ([(EBEvilDB default autoResponses at: key) asByteArray utf8Decoded]
			on: Error do: [ :ex | (EBEvilDB default autoResponses at: key) ])
	]