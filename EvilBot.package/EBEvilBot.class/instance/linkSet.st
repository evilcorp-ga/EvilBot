accessing
linkSet
	^linkSet ifNil: [ linkSet := self class linkSet. linkSet ]