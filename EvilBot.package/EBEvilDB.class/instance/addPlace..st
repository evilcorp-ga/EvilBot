accessing
addPlace: aPlace
	self data at: (aPlace at: '_key' ifAbsent: [UUID new asString]) put: aPlace