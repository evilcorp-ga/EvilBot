rendering
renderTourettesForumOn: html
	html form: [ 
		html textInput 
			placeholder: 'WHORE ASS';
			callback: [ :e | EBEvilDB default addTourettes: e ].
		html submitButton with: 'Save']