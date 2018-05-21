rendering
renderContentOn: html
	| aSecret isValid |
	Smalltalk
		at: #ECDatabase
		ifPresent: [ [ aSecret := html requestContext consumer peek ]
				on: Error
				do: [ :ex | ^ nil ].
			isValid := (((self class environment at: #ECDatabase) default data
				at: 'users')
				select: [ :e | e isAdmin ]
				thenCollect: [ :e | e secret ]) select: [ :e | e = aSecret ].
			isValid isEmpty
				ifTrue: [ ^ nil ] ].
	html text: 'Welcome to the EvilBot Database Editor'.
	html
		table: [ html
				tableRow: [ html tableData
						colSpan: 2;
						id: 'menu';
						with: [ self renderDBListOn: html ] ].
			html
				tableRow: [ html tableData
						id: 'list';
						with: [ self renderCurrancyOn: html ].
					html tableData id: 'content' ] ]