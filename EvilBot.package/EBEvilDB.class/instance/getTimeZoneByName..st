accessing
getTimeZoneByName: aZoneName
	^self timeZones select: [ :e | (e at: 'Location') = aZoneName ]