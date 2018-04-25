accessing
updateYourself
	| aXML aData aLoc aTZTag aPlaceUrl |
	aPlaceUrl := self propertyAt: 'XML'.
	aXML := self getContentsFor: aPlaceUrl.
	aXML isEmptyOrNil ifTrue: [ ^nil ].
	aData := Soup fromString: aXML.
	aLoc := (aData findTag: 'location') nextSibling.
	aTZTag := (aData findTag: 'timezone').
	self propertyAt: 'XML' put: aPlaceUrl.
	self propertyAt: 'Country name' put: (aData findTag: 'country') string.
	self propertyAt: 'Country code' put: (EBEvilDB countryCodes at: (self propertyAt: 'Country name')).
	self propertyAt: 'City name' put: (aData findTag: 'name') string.
	self propertyAt: 'City type' put: (aData findTag: 'type') string.
	self propertyAt: 'longitude' put:  (aLoc attributeAt: 'longitude').
	self propertyAt: 'latitude' put: (aLoc attributeAt: 'latitude').
	self propertyAt: 'geobase' put: (aLoc attributeAt: 'geobase').
	self propertyAt: 'geobaseid' put: (aLoc attributeAt: 'geobaseid').
	self propertyAt: 'altitude' put: (aLoc attributeAt: 'altitude').
	self propertyAt: 'Timezone' put: (aTZTag attributeAt: 'id').
	self propertyAt: 'Timezone Offset' put: (aTZTag attributeAt: 'utcoffsetMinutes').
	self setKey.