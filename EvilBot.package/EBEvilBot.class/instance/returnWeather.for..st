accessing
returnWeather: aLoc for: aWeatherXML
	| aWeather forecast wind|
	aWeather := XMLDOMParser parse: aWeatherXML.
	forecast := ((((aWeather allElementsNamed: 'weatherdata')
	elementAt: 'weatherdata')
	elementAt: 'forecast')
	elementAt: 'tabular')
	elements first.
	wind := (forecast elementAt: 'windDirection').
	self sendCommand:'PRIVMSG ',aLoc,' ',((forecast elementAt: 'symbol') attributeAt: 'name').
	self sendCommand:'PRIVMSG ',aLoc,' ',((forecast elementAt: 'precipitation') attributeAt: 'value'),'% chance of rain'.
	self sendCommand:'PRIVMSG ',aLoc,' Wind: ',
		((wind attributeAt: 'deg'),' ',
		(wind attributeAt: 'code'),' ',
		(wind attributeAt: 'name')),' ',
		((forecast elementAt: 'windSpeed') attributeAt: 'mps'),'mps ',
		((forecast elementAt: 'windSpeed') attributeAt: 'name').
	self sendCommand:'PRIVMSG ',aLoc,' ',((forecast elementAt: 'temperature') attributeAt: 'value'),' Degrees ',((forecast elementAt: 'temperature') attributeAt: 'unit').