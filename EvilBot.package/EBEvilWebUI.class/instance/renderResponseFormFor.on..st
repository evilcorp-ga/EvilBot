rendering
renderResponseFormFor: key on: html
	html form class: 'responses'; with: [ 
		html text: key.
		html break.
		html textInput
			callback: [ :val | EBEvilDB default responses at: key put: val];
			with: ([(EBEvilDB default responses at: key) asByteArray utf8Decoded]
			on: Error do: [ :ex | (EBEvilDB default responses at: key) ]).
		html break.
		html submitButton with: 'Save'.
		html submitButton callback: [ EBEvilDB default responses removeKey: key ifAbsent: [  ] ]; with: 'Delete'
	]