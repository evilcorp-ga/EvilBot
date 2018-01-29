accessing
asWebForm
	^String streamContents: [ :st |
		st nextPutAll: '<form id="',(self at: '_key'),'">'.
		st nextPutAll: '<table>'.
		self properties keysAndValuesDo: [ :k :v |
			self webFormInputFor: k for: v on: st
		].
	]