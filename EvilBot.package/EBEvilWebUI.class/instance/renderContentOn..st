rendering
renderContentOn: html
	html text: 'Welcome to the EvilBot Database Editor'.
	html table: [ 
		html tableRow: [ 
			html tableData colSpan: 2; id: 'menu'; with: [ self renderDBListOn: html ].
		].
		html tableRow: [
			html tableData id: 'list'; with: [ self renderCurrancyOn: html ].
			html tableData id: 'content'
		]
	]