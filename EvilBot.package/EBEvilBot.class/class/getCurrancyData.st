accessing
getCurrancyData
	| aDict |
	aDict := (NeoJSONReader fromString: (ZnEasy get: 'http://apilayer.net/api/live?access_key=',self default currancyKey,'&currencies=EUR,GBP,ZAR,AUD,INR,CAD') contents) at: 'quotes'.
	^aDict
	