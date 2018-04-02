accessing
autoResponses
	^ autoResponses ifNil: [ 
		autoResponses := Dictionary new
		at: 'c++' put: (OrderedCollection with: '"c++ is to c what brain damage is to a brain" -moth');
		at: 'kek' put: (OrderedCollection with: 'STOP THAT! use lol instead');
		at: 'argha' put: (OrderedCollection with: '(╯°□°）╯︵ ┻━┻');
		yourself.
		autoResponses ]