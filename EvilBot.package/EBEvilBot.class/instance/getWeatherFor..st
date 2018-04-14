accessing
getWeatherFor: aUrlString
	| urlArray aUrl aContent |
	urlArray := aUrlString substrings: '/'.
	aUrl := ZnUrl fromString: (urlArray at: 2) defaultScheme: (urlArray at: 1) onlyLetters.
	(urlArray copyFrom: 3 to: (urlArray size)) do: [ :pathSeg | aUrl addPathSegment: pathSeg ].
	aContent := (ZnEasy get: aUrl).
	EBEvilDB default addPlaceFromData: aContent contents.
	^aContent