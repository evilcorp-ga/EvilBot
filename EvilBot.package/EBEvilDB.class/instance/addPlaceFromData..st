accessing
addPlaceFromData: aPlace
	| aXML anItem aData aLoc aTZTag aUrl |
	aXML := aPlace.
	aXML isEmptyOrNil ifTrue: [ ^nil ].
	aData := Soup fromString: aXML.
	aUrl := (((aData findAllChildTags: 'weatherdata')
	first findAllChildTags: 'links')
		first findAllChildTags: 'link') first
			attributeAt: 'url'.
	aLoc := (aData findTag: 'location') nextSibling.
	aTZTag := (aData findTag: 'timezone').
	anItem := EBEvilDataItem new.
	anItem propertyAt: 'XML' put: aUrl.
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