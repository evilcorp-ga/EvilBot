accessing
sendCityHelpCommandForPrv: aLoc cities: aCities country: aCollection 

	| aParser aSt aCountry aCityCol|
			aCityCol := aCities piecesCutWhere: [ :a :b | (aCities indexOf: b) isDivisibleBy: 10 ].
			aCollection isEmptyOrNil ifTrue: [ aCountry := 'NowhereLand' ] ifFalse: [ aCountry := aCollection values first at: 'Country name'].
			self sendPrv: 'Valid Cities for ',aCountry,' are ' to: aLoc.
			aCityCol do: [ :opt |
				aParser := NeoCSVWriter on: (aSt := WriteStream on: '').
				aParser nextPut: opt asOrderedCollection.
				self 
					sendPrv: ((aSt contents copyReplaceAll: (String crlf asString) with: '') asString) utf8Encoded 
					to: aLoc
			]