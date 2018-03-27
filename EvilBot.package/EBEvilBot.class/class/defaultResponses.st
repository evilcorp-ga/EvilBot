accessing
defaultResponses
	^Dictionary new
		at: 'mew' put: 'MEW MEW STYLE! MEW MEW GRACE! MEW MEW POWER! IN YOUR FACE!';
		at: 'porn' put: 'Oh oh oh OH OH AH HA YES YES YES YEEEEEESSSSS';
		yourself
		
	"(aCmd asUppercase beginsWith: 'PORN') ifTrue: [ self sendPrv: 'Oh oh oh OH OH AH HA YES YES YES YEEEEEESSSSS' to: aLoc].
	(aCmd asUppercase beginsWith: 'MEW') ifTrue: [ self sendPrv: 'MEW MEW STYLE! MEW MEW GRACE! MEW MEW POWER! IN YOUR FACE!' to: aLoc].
	(aCmd asUppercase beginsWith: 'ARGHA') ifTrue: [ self sendPrv: '(╯°□°）╯︵ ┻━┻' to: aLoc]."