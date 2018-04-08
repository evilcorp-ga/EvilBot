rendering
renderWeatherFormOn: html
| aNew |
html form class: 'responses'; with: [ 
	html table: [ 
			html tableData: 'Link to English-XML'.
			html tableData: [ html textInput placeholder: 'http://yr.no/places/etc/etc/thing.xml'; callback: [ :val | aNew := val ] 
		
	].
	html submitButton callback: [ 
		EBEvilDB default addPlace: aNew
		 ]; with: 'Submit'.
]]