rendering
renderNewResponseFormOn: html
	| aKey aValue |
	html form: [ 
		html textInput
			placeholder: 'KEY';
			callback: [ :val | aKey := val ].
		html textInput
			placeholder: 'VALUE';
			callback: [ :val | aValue := val ].
		html submitButton
			callback: [ 
				(aKey isEmptyOrNil) | (aValue isEmptyOrNil)
					ifFalse: [ EBEvilDB default responses at: aKey put: aValue ]
			]
		]