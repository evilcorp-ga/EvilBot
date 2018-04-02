rendering
renderResponseFormFor: key on: html
	html form class: 'responses'; with: [ 
		html textInput: key.
		html break.
		html textInput: ([(EBEvilDB default responses at: key) asByteArray utf8Decoded]
			on: Error do: [ :ex | (EBEvilDB default responses at: key) ]).
		"submit button here"
		"delete button here"
	]