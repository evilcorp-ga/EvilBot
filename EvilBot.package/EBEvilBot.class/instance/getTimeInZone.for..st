accessing
getTimeInZone: aTimeZone for: aCmd
| anOffset aTime |
 (aTimeZone includesSubstring: ':')
		ifTrue: [ |a h m|
			a := ((aTimeZone copyFrom: 2 to: aTimeZone size) substrings: ':').
			h := a first asNumber.
			m := a last asNumber.
			anOffset := Time hour: h minute: m second: 0.
			]
		ifFalse: [ | a |
			a := (aTimeZone copyFrom: 2 to: aTimeZone size) asNumber.
			anOffset := Time hour: a minute: 0 second: 0.
		].
(aTimeZone first = $+)
	ifTrue: [ aTime := Time nowUTC addTime: anOffset ]
	ifFalse: [ aTime := Time nowUTC subtractTime: anOffset ].
^aTime