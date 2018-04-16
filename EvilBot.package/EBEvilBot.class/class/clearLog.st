accessing
clearLog
	oldLogs ifNil: [ oldLogs := OrderedCollection new. oldLogs ].
	(oldLogs includes: self logs) ifFalse: [ oldLogs add: self logs veryDeepCopy ].
	logs := nil