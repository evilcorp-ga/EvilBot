initialization
processCommand: aCmd from: anArray
(aCmd = 'INVITE') ifTrue:  [ self processInviteCommandWith: anArray ].
(aCmd = 'NOTICE') ifTrue: [ self processNoticeCommandWith: anArray].
(aCmd = 'PRIVMSG') ifTrue: [ self processPrivMsgCommandWith: anArray ].
(aCmd = 'JOIN') ifTrue: [ self processJoinCommandWith: anArray ].
(aCmd = '353') | (aCmd = 353) ifTrue: [ self processNamesFrom: anArray ].
(aCmd = '372') | (aCmd = 372) ifTrue: [ 
	(hasJoined ifNil: [ hasJoined := false ])
		ifFalse: [ self channels do: [ :e | 
				(e beginsWithSubCollection: '#')
					ifTrue: [ self sendCommand: 'JOIN ',e ]
					ifFalse: [ self sendCommand: 'JOIN #',e  ] ] ].
	hasJoined := true.]
