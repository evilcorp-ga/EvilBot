accessing
reset
	autoResponses isNil ifFalse: [ 
		autoResponses keysAndValuesDo: [ :k :v |
			v class = OrderedCollection ifFalse: [ 
				autoResponses at: k put: (OrderedCollection with: v) ] ] ]