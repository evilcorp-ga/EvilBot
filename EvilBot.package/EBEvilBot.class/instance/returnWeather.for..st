accessing
returnWeather: aLoc for: aWeatherXML
	| aWeather forecast wind forecasts |
aWeather := XMLDOMParser parse: aWeatherXML.
	forecast := (((((aWeather allElementsNamed: 'weatherdata')
	elementAt: 'weatherdata')
	elementAt: 'forecast')
	elementAt: 'tabular') elements copyFrom: 1 to: 3).
forecasts := OrderedCollection new.
forecast doWithIndex: [ :e :i |  | a |
wind := (e elementAt: 'windDirection').
i = 1 ifTrue: [ a := 'Currently it is ' ].
i = 2 ifTrue: [ a := 'Later it''ll be ' ].
i = 3 ifTrue: [ a := 'Much later it''ll be ' ].
a := a,((e elementAt: 'temperature') attributeAt: 'value'),' Degrees ',((e elementAt: 'temperature') attributeAt: 'unit'),
' ',((e elementAt: 'symbol') attributeAt: 'name').
a := a,' with ',((e elementAt: 'precipitation') attributeAt: 'value'),'% chance of rain'..
a := a,' and a ',((e elementAt: 'windSpeed') attributeAt: 'name'),
' blowing at ',((e elementAt: 'windSpeed') attributeAt: 'mps'),'mps in a ',((wind attributeAt: 'deg'),' degree ',
		(wind attributeAt: 'name')),' direction.'.
forecasts add: a.
].
forecasts do: [ :e | self sendPrv: e to: aLoc ]