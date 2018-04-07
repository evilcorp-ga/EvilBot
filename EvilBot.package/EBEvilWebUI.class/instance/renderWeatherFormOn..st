rendering
renderWeatherFormOn: html
| aNew |
aNew := Dictionary new.
aNew at: 'status' put: 'New'.
aNew at: '_key' put: (UUID new asString).
html form class: 'responses'; with: [ 
	html table: [ 
			html tableData: 'Link to English-XML'.
			html tableData: [ html textInput placeholder: 'http://yr.no/places/etc/etc/thing.xml'; callback: [ :val | aNew at: 'Link to English-XML' put: val ] 
		
	].
	html submitButton callback: [ 
		EBEvilDB default addPlace: aNew
		 ]; with: 'Submit'.
]]