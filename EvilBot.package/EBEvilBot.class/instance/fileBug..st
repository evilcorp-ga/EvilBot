accessing
fileBug: aBug
	bugs ifNil: [ bugs := OrderedCollection new. ].
	bugs add: aBug