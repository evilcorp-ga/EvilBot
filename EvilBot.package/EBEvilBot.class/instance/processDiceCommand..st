accessing
processDiceCommand: aLocation
	| aDict aWinner aAll aWinners|
	aDict := Dictionary new.
	self sendCommand: 'NAMES ', aLocation.
	self names ifNotNil: [ :arr |
		arr do: [ :each | 
			(aDict at: (Random new nextInt: arr size) ifAbsentPut: [ OrderedCollection new ]) add: each
		]
	].
aWinner := (aDict keys) max.
aAll := String streamContents: [ :st | aDict keysAndValuesDo: [ :k :v | st nextPutAll: k asString,': '. v do: [ :e | st nextPutAll: e,' ' ] ] ].
aWinners := String streamContents: [ :st | st nextPutAll: 'Winners: '. (aDict at: aWinner) do: [ :v | st nextPutAll: v,' '] ].
self sendPrv: aAll to: aLocation.
self sendPrv: aWinners to: aLocation.
names := nil