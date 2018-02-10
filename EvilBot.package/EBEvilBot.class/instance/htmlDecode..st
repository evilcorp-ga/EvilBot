accessing
htmlDecode: aString
	| newSt |
	newSt := aString.
		#($< '&lt;' $> '&gt;' $& '&amp;' '"' '&quot;' '''' '&#x27;') pairsDo: [ :k :v |
			newSt := newSt copyReplaceAll: v asString with: k asString
		].
	^newSt
			