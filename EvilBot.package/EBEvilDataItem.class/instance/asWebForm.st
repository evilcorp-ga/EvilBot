accessing
asWebForm
	^String streamContents: [ :st |
		st nextPutAll: '<form id="',(self at: '_key'),'">'.
		st nextPutAll: '<table>'.
		self properties keys asSortedCollection do: [:k | 
			(#('_key' 'Country Key' 'City Key') includes: k)
				ifFalse: [ self webFormInputFor: k for: (self propertyAt: k) on: st]
		].
	]