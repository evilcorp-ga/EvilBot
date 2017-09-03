accessing
getGoogleResultFor: aQuery
| aURL aResponse aResults|
true ifTrue: [ ^OrderedCollection with: ('Error' -> 'I can''t seem to do that') ].
aURL := 'https://www.googleapis.com/websearch/v1?key=',gkey,'&cx=',cx,'&q=',aQuery.
aResponse := (ZnEasy get: aURL) contents.
aResponse = 'Not Found' ifTrue: [ ^OrderedCollection with: ('not' -> 'found') ].
aResults := ((NeoJSONReader fromString: aResponse) at: 'items' ifAbsent: [OrderedCollection new]) collect: [ :e | (e at: 'title') -> (e at: 'link') ].
^aResults isEmpty ifTrue:[ OrderedCollection with: ('no' -> 'results') ] ifFalse: [ aResults copyFrom: 1 to: 3 ]