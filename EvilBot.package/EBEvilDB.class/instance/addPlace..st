accessing
addPlace: aPlace
	| aXML anItem aData aLoc aTZTag |
	aXML := aPlace.
	aXML isEmptyOrNil ifTrue: [ ^nil ].
	aData := Soup fromUrl: aXML.
	aLoc := (aData findTag: 'location') nextSibling.
	aTZTag := (aData findTag: 'timezone').
	anItem := EBEvilDataItem new.
	anItem propertyAt: 'XML' put: aPlace.
	anItem propertyAt: 'Country name' put: (aData findTag: 'country') string.
	anItem propertyAt: 'Country code' put: (self class countryCodes at: (anItem propertyAt: 'Country name')).
	anItem propertyAt: 'City name' put: (aData findTag: 'name') string.
	anItem propertyAt: 'City type' put: (aData findTag: 'type') string.
	anItem propertyAt: 'longitude' put:  (aLoc attributeAt: 'longitude').
	anItem propertyAt: 'latitude' put: (aLoc attributeAt: 'latitude').
	anItem propertyAt: 'geobase' put: (aLoc attributeAt: 'geobase').
	anItem propertyAt: 'geobaseid' put: (aLoc attributeAt: 'geobaseid').
	anItem propertyAt: 'altitude' put: (aLoc attributeAt: 'altitude').
	anItem propertyAt: 'Timezone' put: (aTZTag attributeAt: 'id').
	anItem propertyAt: 'Timezone Offset' put: (aTZTag attributeAt: 'utcoffsetMinutes').
	anItem setKey.
	self data at: (anItem key) put: anItem.