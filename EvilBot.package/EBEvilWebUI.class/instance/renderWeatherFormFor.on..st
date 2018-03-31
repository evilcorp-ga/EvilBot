rendering
renderWeatherFormFor: col on: html
html form class: 'responses'; with: [ 
	html table: [ 
		col properties keys asSortedCollection do: [ :k |
			(#('_key' 'Country Key' 'City Key' 'Folketal' ) includes: k) | 
			( k includesSubstring: 'ynorsk' ) |
			( k includesSubstring: 'bookmark' )
			ifFalse: [
				html tableRow: [ 
					html tableData class: 'key'; with: [ html text: k ].
					html tableData with: [
						html textInput
							callback: [ :val | col at: k put: val];
							with: (col at: k)
					]
				]
			]
		]
	].
	html submitButton callback: [ col at: 'status' put: 'pending']; with: 'Edit'.
	html submitButton callback: [ col at: 'status' put: 'OK' ]; with: 'Confirm'
]