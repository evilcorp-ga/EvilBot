accessing
getGoogleResultFor: aQuery
| aTag results |
aTag := Soup fromString: (ZnEasy get: 'http://duckduckgo.com/lite/?q=',aQuery) contents.
results := (aTag findAllTags: 'a') 
	collect: [ :e | | href |
		href := e attributeAt: 'href'.
		href := href copyFrom: (href indexOfSubCollection: 'http') to: href size.
		href urlDecoded ].
results := results copyFrom: 2 to: 4.
^results