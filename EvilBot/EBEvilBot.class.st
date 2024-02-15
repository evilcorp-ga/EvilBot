Class {
	#name : 'EBEvilBot',
	#superclass : 'Object',
	#instVars : [
		'host',
		'port',
		'nick',
		'password',
		'desc',
		'channels',
		'socketStream',
		'gkey',
		'cx',
		'commands',
		'log',
		'names',
		'lastPong',
		'currancyKey',
		'connected',
		'hasJoined'
	],
	#classInstVars : [
		'default',
		'logs',
		'oldLogs'
	],
	#category : 'EvilBot',
	#package : 'EvilBot'
}

{ #category : 'accessing' }
EBEvilBot class >> clearLog [
	oldLogs ifNil: [ oldLogs := OrderedCollection new. oldLogs ].
	(oldLogs includes: self logs) ifFalse: [ oldLogs add: self logs veryDeepCopy ].
	logs := nil
]

{ #category : 'accessing' }
EBEvilBot class >> default [
	^default
]

{ #category : 'accessing' }
EBEvilBot class >> default: aBot [
	default := aBot
]

{ #category : 'accessing' }
EBEvilBot class >> defaultAuthorizedUsers [
	^EBEvilDB default authorizedUsers
]

{ #category : 'accessing' }
EBEvilBot class >> defaultAutoResponses [
	^EBEvilDB default autoResponses
]

{ #category : 'accessing' }
EBEvilBot class >> defaultName [
	^'DevBot'
]

{ #category : 'accessing' }
EBEvilBot class >> defaultResponses [
	^EBEvilDB default responses
]

{ #category : 'accessing' }
EBEvilBot class >> defaultchannels [
	^OrderedCollection with: #evilcorp with: #lobby.
]

{ #category : 'accessing' }
EBEvilBot class >> defaultdesc [
	^'I am an Evil Bot'
]

{ #category : 'accessing' }
EBEvilBot class >> defaulthost [
	^'irc.evilcorp.ga'
]

{ #category : 'accessing' }
EBEvilBot class >> host: aString port: anInt nick: aString2 channels: aCollection [
	^default := self new
		host: aString;
		port: anInt;
		channels: aCollection;
		nick: aString2;
		defaults: '';
		yourself

]

{ #category : 'accessing' }
EBEvilBot class >> host: aString port: anInt nick: aString channels: aCollection password: aPassword [
	default := self new
		host: aString;
		port: anInt;
		channels: aCollection;
		nick: aString;
		defaults: aPassword;
		yourself

]

{ #category : 'accessing' }
EBEvilBot class >> linkSet [
	"Default linkset, change for your own set of links"
	^Dictionary new
		
]

{ #category : 'accessing' }
EBEvilBot class >> logs [
	^logs ifNil: [ logs := Dictionary new. logs ]
]

{ #category : 'accessing' }
EBEvilBot class >> nick: aString channels: aCollection password: aPassword [
	default := self new 
		channels: aCollection;
		nick: aString;
		defaults: aPassword;
		yourself

]

{ #category : 'accessing' }
EBEvilBot class >> quit [
	self allInstancesDo: [ :e | e quit].
	self reset.
]

{ #category : 'accessing' }
EBEvilBot class >> registeredMods [
	^(EBEvilBotMod allSubclasses)
]

{ #category : 'accessing' }
EBEvilBot class >> reset [
	default := nil.
	self clearLog
]

{ #category : 'accessing' }
EBEvilBot class >> restart [
	| aPassword aNick |
	aPassword := self default password.
	aNick := self default nick.
	self quit.
	self start: aPassword nick: aNick
]

{ #category : 'accessing' }
EBEvilBot class >> start: aPassword [
	self start: aPassword nick: self defaultName
]

{ #category : 'accessing' }
EBEvilBot class >> start: aPassword nick: aString [
	self 
		nick: aString
		channels: (self defaultchannels)
		password: aPassword
]

{ #category : 'accessing' }
EBEvilBot class >> styxnet [
	self
		host: 'irc.styxnet.tech'
		port: 6667
		nick: 'styxpet'
		channels: (OrderedCollection with: #transience)
	
]

{ #category : 'accessing' }
EBEvilBot >> adminAddAdmin: aCmd withArray: anArray to: aLoc [
	| anAdmin |
	((aCmd substrings: ' ') size = 3)
		ifTrue: [ 
			anAdmin := (aCmd substrings: ' ') last.
			self authorizedUsers add: anAdmin.
			self sendPrv: (anAdmin,' has been added as an authorized user') to: aLoc
		]
]

{ #category : 'accessing' }
EBEvilBot >> adminAddAutoResponse: aCmd withArray: anArray to: aLoc [
	| arr aKey aValue str |
	arr := aCmd substrings: ' '.
	str := WriteStream on: ''.
	arr size < 2 ifTrue: [ ^nil ].
	aKey := arr at: 2.
	arr doWithIndex: [ :e :i |
		i > 2
			ifTrue: [ str := str nextPutAll: e; space ]
	].
	aValue := str contents trimBoth.
	(self autoResponses at: aKey ifAbsentPut: [ OrderedCollection new ]) add: aValue.
	self sendPrv: (aKey,' has been added to auto response list') to: aLoc
]

{ #category : 'accessing' }
EBEvilBot >> adminAddResponse: aCmd withArray: anArray to: aLoc [
	| arr aKey aValue str |
	arr := aCmd substrings: ' '.
	str := WriteStream on: ''.
	arr size < 2 ifTrue: [ ^nil ].
	aKey := arr at: 2.
	arr doWithIndex: [ :e :i |
		i > 2
			ifTrue: [ str := str nextPutAll: e; space ]
	].
	aValue := str contents trimBoth.
	self responses at: aKey put: aValue.
	self sendPrv: (aKey,' has been added to response list') to: aLoc
]

{ #category : 'accessing' }
EBEvilBot >> adminList: aCmd withArray: anArray to: aLoc [
	| arr aList aSpec|
	arr := aCmd substrings: ' '.
	arr size < 2 ifTrue: [ ^nil ].
	aList := arr second asUppercase.
	aSpec := arr at: 3 ifAbsent: [nil].
	aList = 'ADMIN' ifTrue: [ self sendPrv: (self authorizedUsers asArray asString) to: aLoc ].
	aList = 'RESPONSE' ifTrue: [ self sendPrv: (self responses keys asString) to: aLoc ].
	aList = 'AUTO' ifTrue: [ 
		aSpec isNil
			ifTrue: [ self sendPrv: (self autoResponses keys asString) to: aLoc ]
			ifFalse: [ self sendPrv: (self autoResponses at: aSpec ifAbsent: [OrderedCollection new]) asArray asString to: aLoc ]
	]
]

{ #category : 'accessing' }
EBEvilBot >> adminRemove: aCmd withArray: anArray to: aLoc [
	| arr aList aValue anIndex|
	arr := aCmd substrings: ' '.
	arr size < 3 ifTrue: [ ^'' ].
	aList := arr second asUppercase.
	aValue := arr third.
	anIndex := arr at: 4 ifAbsent: [ 'nil' ].
	anIndex := anIndex asInteger.
	aList = 'RESPONSE' ifTrue: [ 
		self sendPrv: ('Removing ',aValue,' from ', aList asLowercase) to: aLoc.
		self responses removeKey: aValue ifAbsent: [ 
			self sendPrv: (aValue,' doesn''t exist in ',aList asLowercase) to: aLoc] ].
	aList = 'ADMIN' ifTrue: [ 
		self sendPrv: ('Removing ',aValue,' from ', aList asLowercase) to: aLoc.
		self authorizedUsers remove: aValue ifAbsent: [ 
			self sendPrv: (aValue,' doesn''t exist in ',aList asLowercase) to: aLoc ] ].
	aList = 'AUTO' ifTrue: [ 
		anIndex isNil 
			ifTrue: [ 
					self sendPrv: ('Removing ',aValue,' from ', aList asLowercase) to: aLoc.
					self autoResponses removeKey: aValue ifAbsent: [ 
						self sendPrv: (aValue,' doesn''t exist in ',aList asLowercase) to: aLoc ] ]
			ifFalse: [ 
					self sendPrv: ('Removing ',anIndex asString,' from ',aValue,' in ', aList asLowercase) to: aLoc.
				(self autoResponses at: aValue ifAbsent: [OrderedCollection new]) size >= anIndex asInteger
					ifTrue: [ (self autoResponses at: aValue ifAbsent: [OrderedCollection new]) removeIndex: anIndex asNumber ]
					ifFalse: [ self sendPrv: (aValue,' doesn''t have an index of value ',anIndex asString,' in ',aList asLowercase) to: aLoc ] ]
	].
]

{ #category : 'initialization' }
EBEvilBot >> authorizedUsers [
	^self class defaultAuthorizedUsers
]

{ #category : 'accessing' }
EBEvilBot >> autoResponses [
	^self class defaultAutoResponses
]

{ #category : 'accessing' }
EBEvilBot >> channels [
	^ channels ifNil: [ self channels: self class defaultchannels. channels ]
]

{ #category : 'accessing' }
EBEvilBot >> channels: aCollection [
	channels := aCollection asOrderedCollection
]

{ #category : 'accessing' }
EBEvilBot >> commands [
	^commands ifNil: [ commands := OrderedCollection new. commands ]
]

{ #category : 'accessing' }
EBEvilBot >> currancyData [
	^self class getCurrancyData
]

{ #category : 'accessing' }
EBEvilBot >> defaults [
	self setKeys.
	self desc: (self class defaultdesc).
	socketStream := SocketStream openConnectionToHostNamed: self host port: self port.
	socketStream noTimeout.
	socketStream autoFlush.
	self log: socketStream nextLine.
	self log: socketStream nextLine.
	socketStream sendCommand: 'USER ',self nick,' ',self nick,' ',self nick,': I am EVIL'.
	socketStream sendCommand: 'NICK ',self nick.
	socketStream flush.
	self setupCommandFiltering.

]

{ #category : 'accessing' }
EBEvilBot >> defaults: aPass [
	self password: aPass.
	self setKeys.
	socketStream := SocketStream openConnectionToHostNamed: self host port: self port.
	socketStream noTimeout.
	socketStream autoFlush.
	self log: socketStream nextLine.
	self log: socketStream nextLine.
	socketStream sendCommand: 'USER ',self nick,' ',self nick,' ',self nick,': I am EVIL'.
	socketStream sendCommand: 'NICK ',self nick.
	socketStream flush.
	self setupCommandFiltering.
	

]

{ #category : 'accessing' }
EBEvilBot >> desc [
	^ desc
]

{ #category : 'accessing' }
EBEvilBot >> desc: anObject [
	desc := anObject
]

{ #category : 'initialization' }
EBEvilBot >> getArrFrom: aLine [
	| snd |
	snd := (aLine copyFrom: 2 to: aLine size) indexOfSubCollection: ':'.
	^snd > 1
		ifTrue: [
			Array
				with: (aLine copyFrom: 2 to: snd)
				with: (aLine copyFrom: (snd + 2) to: aLine size)
		]
		ifFalse: [ nil ]
]

{ #category : 'accessing' }
EBEvilBot >> host [
	^ host ifNil: [ self class defaultHostname ]
]

{ #category : 'accessing' }
EBEvilBot >> host: anObject [
	host := anObject
]

{ #category : 'accessing' }
EBEvilBot >> htmlDecode: aString [
	| newSt |
	newSt := aString.
		#($< '&lt;' $> '&gt;' $& '&amp;' '"' '&quot;' '''' '&#x27;') pairsDo: [ :k :v |
			newSt := newSt copyReplaceAll: v asString with: k asString
		].
	^newSt
			
]

{ #category : 'initialization' }
EBEvilBot >> isAuthorized: anArray [
	self authorizedUsers do: [ :e | 
		(anArray first beginsWith: e)
			ifTrue: [ ^true ]
	].
	^false
]

{ #category : 'initialization' }
EBEvilBot >> isConnected [
	^connected ifNil: [ connected := false. connected ]
]

{ #category : 'initialization' }
EBEvilBot >> isValidUrl: aString [
| aUrl |
(aString includesSubstring: ' ') ifTrue: [ ^false ].
[aUrl := ZnUrl fromString: aString] on: Error do: [:ex | ^false ].
^(aUrl hasScheme) & (aUrl hasHost)
]

{ #category : 'initialization' }
EBEvilBot >> lastPong: anArray [
| aUser |
	aUser := (anArray first substrings: '!') first.
	self sendPrv: (aUser ,' PONG ',(Time now subtractTime: lastPong value) asSeconds asString,' seconds') to: lastPong key.
	
]

{ #category : 'accessing' }
EBEvilBot >> log [
	^log ifNil: [ 
		log := WriteStream on: ''.
		log]
]

{ #category : 'accessing' }
EBEvilBot >> log: aString [
	(self class logs at: Date today ifAbsentPut: [ OrderedCollection new ]) add: aString
]

{ #category : 'accessing' }
EBEvilBot >> names [
	^names
]

{ #category : 'accessing' }
EBEvilBot >> names: aString [ 
	names := (aString substrings: ' ') collect: [ :e | e select: [ :c | c isAlphaNumeric | (c = $-) ] ].
]

{ #category : 'accessing' }
EBEvilBot >> nick [
	^ nick ifNil: [ nick := 'DevBot'. nick ]
]

{ #category : 'accessing' }
EBEvilBot >> nick: anObject [
	nick := anObject
]

{ #category : 'accessing' }
EBEvilBot >> password [
	^password
]

{ #category : 'accessing' }
EBEvilBot >> password: aPassword [
	password := aPassword
]

{ #category : 'accessing' }
EBEvilBot >> port [
	^ port ifNil: [  self class defaultPort ]
]

{ #category : 'accessing' }
EBEvilBot >> port: anObject [
	port := anObject
]

{ #category : 'accessing' }
EBEvilBot >> privateMsgFrom: anArray [
	|aUser aCmd |
	aUser := (anArray first substrings: '!') first.
	aCmd := anArray at: 2.
	self processCommand: aCmd withArray: anArray forLocation: aUser
]

{ #category : 'accessing' }
EBEvilBot >> processAdminCommands: aCmd withArray: anArray toLocation: aLoc [
	(aCmd substrings: ' ') isEmpty ifTrue: [ ^nil ].
	(self isAuthorized: anArray)
		ifTrue: [ | aCMD |
			aCMD := (aCmd substrings: ' ') first asUppercase.
			(aCMD asUppercase = 'ADMIN') ifTrue: [ self adminAddAdmin: aCmd withArray: anArray to: aLoc ].
			(aCMD asUppercase = 'AUTO') ifTrue: [ self adminAddAutoResponse: aCmd withArray: anArray to: aLoc ].
			(aCMD asUppercase = 'RESPONSE') ifTrue: [ self adminAddResponse: aCmd withArray: anArray to: aLoc ].
			(aCMD asUppercase = 'REMOVE') ifTrue: [ self adminRemove: aCmd withArray: anArray to: aLoc ].
			(aCMD asUppercase = 'LIST') ifTrue: [ self adminList: aCmd withArray: anArray to: aLoc ]
		]
		ifFalse: [ 
			( #('ADMIN' 'AUTO' 'RESPONSE' 'REMOVE') includes: (aCmd copyUpTo: (Character space)) asUppercase )
				ifTrue: [ self sendPrv: 'YOU NOT THE BOSS OF ME' to: aLoc ]
		]
]

{ #category : 'initialization' }
EBEvilBot >> processAutomatedResponsesFrom: anArray [
| aNick aLoc |
	( #('ADMIN' 'AUTO' 'RESPONSE' 'REMOVE' 'LIST') includes: ((anArray at: 2) copyUpTo: (Character space)) asUppercase )
		ifTrue: [ ^nil ].
	aLoc := ((anArray first substrings: ' ') last).
	aNick := [((anArray first substrings: '!') first)] on: Error do: [ :ex | 'Hey You' ].
	self autoResponses keysAndValuesDo: [ :k :v |
		((anArray at: 2) asUppercase includesSubstring: k asUppercase)
			ifTrue: [ 
				| aRes anAuto |
				v isEmpty ifFalse: [
					anAuto := v at: ((Random new) nextInteger: (v size)).
					aRes := anAuto copyReplaceAll: '$nick' with: aNick.
					aRes := aRes copyReplaceAll: '$chan' with: aLoc.
					self sendPrv: aRes to: aLoc ] ]
		 ].
]

{ #category : 'accessing' }
EBEvilBot >> processCommand: aCmd [
	
]

{ #category : 'initialization' }
EBEvilBot >> processCommand: aCmd from: anArray [
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

]

{ #category : 'accessing' }
EBEvilBot >> processCommand: aCmd withArray: anArray [
	| aLoc |
	aLoc := ((anArray first substrings: ' ') last).
	self processCommand: aCmd withArray: anArray forLocation: aLoc
]

{ #category : 'accessing' }
EBEvilBot >> processCommand: aCmd withArray: anArray forLocation: aLoc [
	self class registeredMods do: [ :each |
			(each respondsToCommand: aCmd) ifTrue: [  
				each new: anArray location: aLoc bot: self
			 ]
		].
	(aCmd asUppercase = 'SAVE') ifTrue: [ self processSaveCommand: anArray to: aLoc ].
	(aCmd asUppercase = 'QUIT') ifTrue: [ self processQuitCommand: aLoc with: anArray  ].
	(aCmd asUppercase beginsWith: '?HELP') ifTrue: [ self processHelpCommand: anArray to: aLoc ].
	self processAdminCommands: aCmd withArray: anArray toLocation: aLoc.
	self processResponseCommands: aCmd withArray: anArray toLocation: aLoc
	
]

{ #category : 'accessing' }
EBEvilBot >> processHelpCommand: anArray to: aLoc [
	
]

{ #category : 'accessing' }
EBEvilBot >> processHelpCommandFor: aCommand to: aLoc [
	
]

{ #category : 'initialization' }
EBEvilBot >> processInviteCommandWith: anArray [
	| aChan |
	aChan := anArray last.
	aChan isEmptyOrNil ifTrue: [ ^nil ].
	aChan first = $# ifFalse: [ ^nil ].
	aChan := (((anArray at: 2) copyWithout: $#) asLowercase asSymbol).
	(self channels includes: aChan ) ifFalse: [ self channels add: aChan]
]

{ #category : 'initialization' }
EBEvilBot >> processJoinCommandWith: anArray [
	| aUser  |
	anArray isEmptyOrNil ifTrue: [ ^nil ].
	(anArray first substrings: '!') isEmptyOrNil ifTrue: [ ^nil ].
	aUser := (anArray first substrings: '!') first.
	aUser = self nick 
		ifTrue: [ | aChan |
			aChan := (((anArray at: 2) copyWithout: $#) asLowercase asSymbol).
			(self channels includes: aChan ) ifFalse: [ self channels add: aChan] ]
		ifFalse: [ 
			self sendPrv: 'Welcome ', aUser to: (anArray at: 2) ]
]

{ #category : 'initialization' }
EBEvilBot >> processNamesFrom: anArray [
	self names: (anArray at: 2)
]

{ #category : 'initialization' }
EBEvilBot >> processNoticeCommandWith: anArray [
		((anArray at: 2) beginsWith: 'This nickname is registered and protected.') |
		((anArray at: 2) beginsWith: 'please choose a different nick')
			ifTrue: [
				self sendCommand: 'PRIVMSG nickserv identify ', self password.
			].
		((anArray at: 2) copyWithout: (Character home)) trimBoth = 'PING' ifTrue: [ self lastPong: anArray ].
		((anArray at: 2) copyWithout: (Character home)) trimBoth = 'PING undefined' ifTrue: [ self lastPong: anArray ].
]

{ #category : 'accessing' }
EBEvilBot >> processPingFrom: anArray to: aLoc [
	| aUser  |
	aUser := (anArray first substrings: '!') first.
	(anArray last substrings: ' ') size > 1 ifTrue: [ aUser := (anArray last substrings: ' ') last trimBoth ].
	lastPong := aLoc -> (Time now).
	self sendCommand: 'PRIVMSG ',aUser,' :',(Character home asString),'PING',(Character home asString).
]

{ #category : 'initialization' }
EBEvilBot >> processPrivMsgCommandWith: anArray [
		(((anArray first substrings: ' ') last) = self nick )
			ifTrue: [ self privateMsgFrom: anArray ]
			ifFalse:[
				((anArray at: 2) asUppercase includesSubstring: (self nick asUppercase))
					ifTrue: [ self sendPrv: self randomGreeting to: ((anArray first substrings: ' ') last)].
				(self isValidUrl: (anArray at: 2)) ifTrue: [ self sendLinkDesc: (anArray at: 2) to: ((anArray first substrings: ' ') last) ].
				self processCommand: (anArray at: 2) withArray: anArray.
				self processAutomatedResponsesFrom: anArray
			]
]

{ #category : 'initialization' }
EBEvilBot >> processQuitCommand: aLoc with: anArray [ 
	(self isAuthorized: anArray)
			ifTrue: [
				self sendCommand: 'PRIVMSG ',aLoc,' :Bye Bye :('.
				self quit.]
			ifFalse: [self sendCommand: 'PRIVMSG ',aLoc,' :You''re not the boss of me!']
]

{ #category : 'accessing' }
EBEvilBot >> processResponseCommands: aCmd withArray: anArray toLocation: aLoc [
	| aNick |
	aNick := [((anArray first substrings: '!') first)] on: Error do: [ :ex | 'Hey You' ].
	self responses keysAndValuesDo: [ :k :v  |
		(aCmd asUppercase = k asUppercase)
			ifTrue: [ | aRes |
				aRes := v copyReplaceAll: '$nick' with: aNick.
				aRes := aRes copyReplaceAll: '$chan' with: aLoc.
				self sendPrv: aRes to: aLoc ]
			].
	
]

{ #category : 'accessing' }
EBEvilBot >> processSaveCommand: anArray to: aLoc [
	(self isAuthorized: anArray)
			ifTrue: [
				FLSerializer serialize: (EBEvilDB default) toFileNamed: (FileSystem workingDirectory pathString),'/evilbot.fl'.
				self sendCommand: 'PRIVMSG ',aLoc,' :I did a SAVE! 8-D']
			ifFalse: [self sendCommand: 'PRIVMSG ',aLoc,' :You''re not the boss of me!']
]

{ #category : 'accessing' }
EBEvilBot >> quit [
	socketStream isNil ifFalse: [
	socketStream isConnected 
		ifTrue: [ 
			socketStream sendCommand: 'QUIT I''m Melting'.
			socketStream flush; close.
		]
	]
]

{ #category : 'initialization' }
EBEvilBot >> randomGreeting [
	^('BONJOUR (French)
HOLA (Spanish)
HALLO (German)
GUTEN TAG (German)
CIAO (Italian)
OLÀ (Portuguese)
NAMASTE (Hindi)
SALAAM (Persian (Farsi))
ZDRAS-TVUY-TE (Russian)
OHAYO (Japanese)
KONNICHIWA (Japanese)
KONBAN WA (Japanese)
AHN-YOUNG-HA-SE-YO (Korean)
MERHABA (Turkish)
SAIN BAINUU (Mongolian)
SALEMETSIZ BE? (Kazakh)
SZIA (Hungarian)
MARHABA (Arabic)
SANNU (Hausa)
SALAMA ALEIKUM (Hausa)
JAMBO (Swahili)
HABARI (Swahili)
',((ByteArray readHexFrom: 'e4bda0') utf8Decoded),
((ByteArray readHexFrom: 'e5a5bd') utf8Decoded),' (Mandarin (Thanks Sk2))
NAY HOH (Cantonese (Yue))
HALO (Bahasa Indonesia)
YOUR MOM (Punk)
' substrings: (String crlf)) at: ((Random new) nextInteger: 26)
]

{ #category : 'accessing' }
EBEvilBot >> resetNames [
	names := nil
]

{ #category : 'accessing' }
EBEvilBot >> responses [
	^self class defaultResponses
]

{ #category : 'accessing' }
EBEvilBot >> sendAct: aString to: anEntity [
	self sendCommand: 'PRIVMSG ',anEntity,':',(Character home asString),'ACTION ',aString,(Character home asString)
]

{ #category : 'private protocol' }
EBEvilBot >> sendCommand: aString [
	[socketStream sendCommand: aString] on: Error do: [ :ex | socketStream sendCommand: aString utf8Encoded ].
]

{ #category : 'initialization' }
EBEvilBot >> sendLinkDesc: aLink to: aLoc [
 | aUrl aTitle aLinkString |
	aLinkString := aLink.
	aUrl := ZnUrl fromString: aLinkString.
	[[aTitle := (((Soup fromString: aUrl retrieveContents) findTag: 'head') findTag: 'title') text.
	self sendPrv: aTitle to: aLoc] on: Error do: [ :ex | 
		self sendPrv: ex asString to: aLoc ]] fork
]

{ #category : 'accessing' }
EBEvilBot >> sendPong: aLine [
	| anArr |
	anArr := aLine substrings: ' '.
	self sendCommand: 'PONG ',anArr last.
]

{ #category : 'accessing' }
EBEvilBot >> sendPrv: aString to: anEntity [
	| aPriv |
	aPriv := 'PRIVMSG ',anEntity,' :',aString.
	[ aPriv := aPriv utf8Encoded asString] on: Error do: [:ex | ].
	self log: aPriv.
	self sendCommand: aPriv.
]

{ #category : 'accessing' }
EBEvilBot >> setKeys [
gkey := 'AIzaSyDfHCmltrwSXvxa0IdMr_0MaRejK0K5AmE'.
cx := '011057986802624939462:kku_6mla-yq'.
]

{ #category : 'initialization' }
EBEvilBot >> setupCommandFiltering [
	[ [ socketStream isConnected ]
		whileTrue: [ | anArr textArr aCmd aLine |
			aLine := [ socketStream nextLine ]
				on: ConnectionClosed
				do: [ self class quit ].
			aLine = EBEvilBot
				ifFalse: [  
			(aLine beginsWith: 'PING')
				ifTrue: [ 
					self channels do: [ :e | self sendCommand: 'JOIN #',e ].
					self sendPong: aLine ]
				ifFalse: [ 
					aLine := [ aLine asByteArray utf8Decoded ] on: Error do: [:ex | aLine := aLine ].
					self log: aLine.
					anArr := aLine substrings: ' '.
					textArr := self getArrFrom: aLine.
					aCmd := anArr size > 1
						ifTrue: [ anArr at: 2 ]
						ifFalse: [ 0 ].
					self processCommand: aCmd from: textArr ] ] ] ] fork
]
