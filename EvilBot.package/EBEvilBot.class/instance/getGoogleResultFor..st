accessing
getGoogleResultFor: aQuery
| aTag results |
aTag := Soup fromString: (ZnEasy get: 'http://duckduckgo.com/lite/?q=',aQuery urlEncoded) contents.
results := (aTag findAllTags: 'a') 
	collect: [ :e | | href |
		href := e attributeAt: 'href'.
		href := [href copyFrom: (href indexOfSubCollection: 'http') to: href size] 
			on: Error do: [:ex | 'huh?'].
		href urlDecoded ].
results := results reject: [ :e | (e includesSubstring: 'duckduckgo') | (e = 'huh?') ].
results := [results copyFrom: 1 to: 3] 
	on: Error do: [:ex | OrderedCollection with: 'An Error Occured'].
^results