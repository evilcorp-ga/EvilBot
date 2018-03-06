accessing
setupTourettesPage
	self pot GET: '/tourettes' -> self tourettesData.
	self pot POST: '/tourettes' -> [ :val | 
		EBEvilDB default tourettes add: (val at: #value).
		self tourettesData ]
	