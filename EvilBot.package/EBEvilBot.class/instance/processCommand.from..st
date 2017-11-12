initialization
processCommand: aCmd from: anArray
(aCmd = 'NOTICE') ifTrue: [ self processNoticeCommandWith: anArray].
(aCmd = 'PRIVMSG') ifTrue: [ self processPrivMsgCommandWith: anArray ].
(aCmd = 'JOIN') ifTrue: [ self processJoinCommandWith: anArray ].
(aCmd = 'QUIT') ifTrue: [ self processQuitCommandWtih: anArray ].
(aCmd = '353') | (aCmd = 353) ifTrue: [ self processNamesFrom: anArray ].
