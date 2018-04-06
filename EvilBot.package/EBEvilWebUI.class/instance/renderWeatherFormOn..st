rendering
renderWeatherFormOn: html
| aNew |
aNew := Dictionary new.
aNew at: 'status' put: 'New'.
aNew at: '_key' put: (UUID new asString).
html form class: 'responses'; with: [ 
	html table: [ 
		html tableRow: [ 
			html tableData: 'City name English'. 
			html tableData: [ html textInput placeholder: 'Wadsworth'; callback: [ :val | aNew at: 'City name English' put: val ] ] ].
		html tableRow: [
			html tableData: 'Country code'.
			html tableData: [ html textInput placeholder: 'US'; callback: [ :val | aNew at: 'Country code' put: val ] ] ].
		html tableRow: [
			html tableData: 'Country name English'.
			html tableData: [ html textInput placeholder: 'United States'; callback: [ :val | aNew at: 'Country name English' put: val ] ] ].
		html tableRow: [
			html tableData: 'Link to English-XML'.
			html tableData: [ html textInput placeholder: 'http://yr.no/places/etc/etc/thing.xml'; callback: [ :val | aNew at: 'Link to English-XML' put: val ] ] ]
		
	].
	html submitButton callback: [ 
		EBEvilDB default addPlace: aNew
		 ]; with: 'Submit'.
]