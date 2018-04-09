rendering
renderWeatherFormFor: col on: html
	html table: [ 
		col properties keys asSortedCollection do: [ :k |
				html tableRow: [ 
					html tableData class: 'key'; with: [ html text: k ].
					html tableData with: [
						html text: (col at: k)
					]
				]
			]
	].
