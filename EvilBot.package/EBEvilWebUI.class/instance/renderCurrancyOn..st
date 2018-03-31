rendering
renderCurrancyOn: html
	self currancy = 'tourettes' ifTrue: [ self renderTourettesDataOn: html ].
	self currancy = 'weather' ifTrue: [ self renderWeatherDataOn: html ].
	self currancy = 'response' ifTrue: [ self renderResponseDataOn: html ].
	self currancy = 'autoresponse' ifTrue: [ self renderAutoResponseDataOn: html ]