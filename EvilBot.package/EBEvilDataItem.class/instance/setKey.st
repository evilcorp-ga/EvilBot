accessing
setKey
	self propertyAt: '_key'
		put: (self propertyAt: 'longitude'),'_',(self propertyAt: 'latitude')