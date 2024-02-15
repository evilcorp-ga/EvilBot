Class {
	#name : 'EBEvilDB',
	#superclass : 'Object',
	#instVars : [
		'data',
		'places',
		'timeZones',
		'eightball',
		'tourettes',
		'responses',
		'autoResponses',
		'authorizedUsers'
	],
	#classInstVars : [
		'default'
	],
	#category : 'EvilBot',
	#package : 'EvilBot'
}

{ #category : 'accessing' }
EBEvilDB class >> countryCodes [
	^NeoJSONReader fromString: '{"Iran":"IR","Jamaica":"JM","Suriname":"SR","Gabon":"GA","Bouvet Island":"BV","Cook Islands":"CK","Armenia":"AM","Germany":"DE","Benin":"BJ","Macedonia":"MK","Ukraine":"UA","Cape Verde":"CV","Brunei":"BN","Nicaragua":"NI","Estonia":"EE","Ecuador":"EC","Cameroon":"CM","Romania":"RO","Cayman Islands":"KY","Brazil":"BR","Palau":"PW","Sri Lanka":"LK","Trinidad and Tobago":"TT","Viet Nam":"VN","Dominica":"DM","Guernsey":"GG","Namibia":"NA","Heard Island and McDonald Islands":"HM","Cyprus":"CY","Bahamas":"BS","North Pole":"XN","Norfolk Island":"NF","Nigeria":"NG","Pakistan":"PK","Paraguay":"PY","Palestine":"PS","Lebanon":"LB","Tanzania":"TZ","Saint Vincent and the Grenadines":"VC","Senegal":"SN","Nepal":"NP","Algeria":"DZ","Russia":"RU","Uganda":"UG","Djibouti":"DJ","French Guiana":"GF","South Sudan":"SS","Saint Barthélemy":"BL","Zimbabwe":"ZW","Ghana":"GH","Nauru":"NR","Laos":"LA","Netherlands":"NL","Libya":"LY","Guyana":"GY","Greece":"GR","Philippines":"PH","United Kingdom":"GB","Moldova":"MD","Cuba":"CU","Venezuela":"VE","Micronesia":"FM","Burundi":"BI","Tunisia":"TN","Haiti":"HT","Christmas Island":"CX","Equatorial Guinea":"GQ","American Samoa":"AS","Iraq":"IQ","Slovenia":"SI","Jordan":"JO","Greenland":"GL","Kyrgyzstan":"KG","Timor-Leste":"TL","Fiji":"FJ","Sint Maarten":"SX","Belize":"BZ","Seychelles":"SC","Pitcairn":"PN","Guinea-Bissau":"GW","Faroe Islands":"FO","Falkland Islands (Malvinas)":"FK","Anguilla":"AI","Sweden":"SE","Saudi Arabia":"SA","Chad":"TD","Somalia":"SO","Saint Martin":"MF","China":"CN","Madagascar":"MG","Côte d’Ivoire":"CI","Togo":"TG","Eritrea":"ER","Sierra Leone":"SL","Portugal":"PT","Réunion":"RE","Liberia":"LR","Guam":"GU","Mauritania":"MR","Maldives":"MV","Italy":"IT","Bahrain":"BH","Martinique":"MQ","French Polynesia":"PF","Samoa":"WS","South Korea":"KR","Cocos (Keeling) Islands":"CC","Guatemala":"GT","Swaziland":"SZ","Bangladesh":"BD","Andorra":"AD","Canada":"CA","Gambia":"GM","Uruguay":"UY","United Arab Emirates":"AE","Montenegro":"ME","Taiwan":"TW","Marshall Islands":"MH","Colombia":"CO","Argentina":"AR","Japan":"JP","Hong Kong":"HK","Malawi":"MW","Central African Republic":"CF","Latvia":"LV","Bermuda":"BM","British Indian Ocean Territory":"IO","Luxembourg":"LU","São Tomé and Príncipe":"ST","Antarctica":"AQ","Egypt":"EG","Slovakia":"SK","Mali":"ML","Dominican Republic":"DO","Aruba":"AW","Mozambique":"MZ","Comoros":"KM","Tokelau":"TK","El Salvador":"SV","Jersey":"JE","Bhutan":"BT","Niue":"NU","Saint Lucia":"LC","Panama":"PA","Burma":"MM","Macau":"MO","Czech Republic":"CZ","Guinea":"GN","Kuwait":"KW","South Georgia and The South Sandwich Islands":"GS","Kenya":"KE","New Caledonia":"NC","Bolivia":"BO","Rwanda":"RW","Western Sahara":"EH","New Zealand":"NZ","Yemen":"YE","Honduras":"HN","Syria":"SY","Barbados":"BB","Antigua and Barbuda":"AG","Belgium":"BE","Botswana":"BW","Liechtenstein":"LI","Vatican City":"VA","Poland":"PL","Uzbekistan":"UZ","Mexico":"MX","South Africa":"ZA","Qatar":"QA","Peru":"PE","Mayotte":"YT","Gibraltar":"GI","Austria":"AT","Saint Pierre and Miquelon":"PM","Mongolia":"MN","Singapore":"SG","Vanuatu":"VU","Turkey":"TR","Denmark":"DK","Bosnia and Herzegovina":"BA","Virgin Islands, U.S.":"VI","Tuvalu":"TV","Costa Rica":"CR","Niger":"NE","Wallis and Futuna":"WF","Congo-Kinshasa":"CD","Saint Kitts and Nevis":"KN","Angola":"AO","Congo-Brazzaville":"CG","Indonesia":"ID","Georgia":"GE","Spain":"ES","Malaysia":"MY","Turks and Caicos Islands":"TC","Virgin Islands, British":"VG","Mauritius":"MU","North Korea":"KP","Ireland":"IE","Oman":"OM","Turkmenistan":"TM","Belarus":"BY","Isle of Man":"IM","France":"FR","Guadeloupe":"GP","Chile":"CL","Curaçao":"CW","Malta":"MT","French Southern Territories":"TF","Serbia":"RS","Montserrat":"MS","Australia":"AU","Iceland":"IS","Cambodia":"KH","United States":"US","Israel":"IL","Papua New Guinea":"PG","Albania":"AL","Monaco":"MC","Northern Mariana Islands":"MP","Morocco":"MA","Kazakhstan":"KZ","Finland":"FI","Saint Helena":"SH","Sudan":"SD","Zambia":"ZM","Lesotho":"LS","India":"IN","Solomon Islands":"SB","Azerbaijan":"AZ","Bonaire, Saint Eustatius and Saba":"BQ","Croatia":"HR","Tajikistan":"TJ","Lithuania":"LT","Ethiopia":"ET","Åland Islands":"AX","Puerto Rico":"PR","Grenada":"GD","Bulgaria":"BG","Kosovo":"XK","Switzerland":"CH","Tonga":"TO","Afghanistan":"AF","San Marino":"SM","Hungary":"HU","Thailand":"TH","Kiribati":"KI","Burkina Faso":"BF","Norway":"NO"}'
]

{ #category : 'accessing' }
EBEvilDB class >> default [
	^default ifNil: [ default := self new. default ]
]

{ #category : 'accessing' }
EBEvilDB class >> default: aDefault [
	default := aDefault
]

{ #category : 'actions' }
EBEvilDB class >> loadLatestCode [
	IceRepository allInstances do: [ :irp |  (irp name = 'EvilBot') ifTrue: [  irp loadedPackages do: [ :pkg | pkg loadLatest ] ] ].
	Transcript crShow: 'Loaded Latest Bot Code'
]

{ #category : 'actions' }
EBEvilDB class >> register [
	Smalltalk addToStartUpList: self
]

{ #category : 'actions' }
EBEvilDB class >> restore [
	self default: (FLMaterializer materializeFromFileNamed: (FileSystem workingDirectory pathString),'/evilbot.fl').
]

{ #category : 'actions' }
EBEvilDB class >> save [
	FLSerializer serialize: self default toFileNamed: (FileSystem workingDirectory pathString),'/evilbot.fl'.

]

{ #category : 'actions' }
EBEvilDB class >> shutDown [
	self save.
	Transcript crShow: 'Bot Data Saved'
]

{ #category : 'actions' }
EBEvilDB class >> startUp [
	self loadLatestCode.
	self restore.
	Transcript crShow: 'Bot Data Restore'
]

{ #category : 'accessing' }
EBEvilDB >> addTourettes: aString [
	self tourettes add: aString
]

{ #category : 'accessing' }
EBEvilDB >> at: aKey [
	^self data at: aKey ifAbsent: [ nil ]
]

{ #category : 'accessing' }
EBEvilDB >> authorizedUsers [
	^ authorizedUsers ifNil: [ authorizedUsers := OrderedCollection with: 'dusty!dusty@evilcorp.ga'. authorizedUsers]
]

{ #category : 'accessing' }
EBEvilDB >> authorizedUsers: anObject [
	authorizedUsers := anObject
]

{ #category : 'accessing' }
EBEvilDB >> autoResponses [
	^ autoResponses ifNil: [ 
		autoResponses := Dictionary new
		at: 'c++' put: (OrderedCollection with: '"c++ is to c what brain damage is to a brain" -moth');
		at: 'kek' put: (OrderedCollection with: 'STOP THAT! use lol instead');
		at: 'argha' put: (OrderedCollection with: '(╯°□°）╯︵ ┻━┻');
		yourself.
		autoResponses ]
]

{ #category : 'accessing' }
EBEvilDB >> autoResponses: anObject [
	autoResponses := anObject
]

{ #category : 'accessing' }
EBEvilDB >> data [
	^data ifNil: [ data := Dictionary new. data ]
]

{ #category : 'accessing' }
EBEvilDB >> data: aDictionary [
	data := aDictionary
]

{ #category : 'accessing' }
EBEvilDB >> reset [
	autoResponses isNil ifFalse: [ 
		autoResponses keysAndValuesDo: [ :k :v |
			v class = OrderedCollection ifFalse: [ 
				autoResponses at: k put: (OrderedCollection with: v) ] ] ]
]

{ #category : 'accessing' }
EBEvilDB >> responses [
	^ responses ifNil: [ 
		responses := Dictionary new
		at: 'mew' put: 'MEW MEW STYLE! MEW MEW GRACE! MEW MEW POWER! IN YOUR FACE!';
		at: 'porn' put: 'Oh oh oh OH OH AH HA YES YES YES YEEEEEESSSSS';
		yourself.
		responses ]
]

{ #category : 'accessing' }
EBEvilDB >> responses: anObject [
	responses := anObject
]

{ #category : 'accessing' }
EBEvilDB >> tourettes [
	^tourettes ifNil: [ tourettes := OrderedCollection new. tourettes ]
]
