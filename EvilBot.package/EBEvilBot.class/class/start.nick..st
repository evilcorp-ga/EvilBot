accessing
start: aPassword nick: aString
	| oldStuff |
	oldStuff := self new nick: aString;  yourself.
	default notNil ifTrue: [
		oldStuff instVarNamed: 'authorizedUsers' put: default authorizedUsers.
		oldStuff instVarNamed: 'autoResponses' put: default autoResponses.
		oldStuff instVarNamed: 'responses' put: default responses
	].
	default := oldStuff defaults: aPassword; yourself
