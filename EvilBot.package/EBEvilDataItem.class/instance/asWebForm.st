accessing
asWebForm
	^String streamContents: [ :st |
		st nextPutAll: '<form method="post" action="/evildb/',(self at: '_key'),'" id="',(self at: '_key'),'">'.
		st nextPutAll: '<table>'.
		self properties keys asSortedCollection do: [:k | 
			(#('_key' 'Country Key' 'City Key' 'Folketal' 'status') includes: k) | 
			( k includesSubstring: 'ynorsk' ) |
			( k includesSubstring: 'bookmark' )
				ifFalse: [ self webFormInputFor: k for: (self propertyAt: k) on: st]
		].
		st nextPutAll: '</table><input type="submit" value="Submit" /></form>'
	]