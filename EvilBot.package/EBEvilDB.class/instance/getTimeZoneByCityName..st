accessing
getTimeZoneByCityName: aCityName
	| aCol | 
		aCol := self data values select: [ :e | (e at: 'City name') asUppercase = aCityName asUppercase ].
		aCol := aCol asSet asOrderedCollection.
		aCol do: [ :e | e updateYourself ].
		^aCol collect: [ :e | | aPlace aTime |
			aTime := [ (Time nowUTC addTime: ((e at: 'Timezone Offset') asNumber * 60) asDuration) ] on: Error do: [ 'No Data' ].
			aPlace := (e at: 'Timezone') ifNil: [ 'No Data' ].
			aPlace -> aTime ]