rendering
renderWeatherDataOn: html
	self currancy: 'weather'.
	html unorderedList: [
		(EBEvilDB default dataAsHierarchy keys asSortedCollection) do: [ :country |
			html listItem with: [
				html div onClick: (html jQuery this next toggle); with: [ html text: country].
				html unorderedList class: 'cities'; with: [
					self renderWeatherDataFor: country on: html
				]
			]
		].
		"new button here"
	]