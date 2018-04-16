accessing
nick: aString channels: aCollection password: aPassword
	default := self new 
		channels: aCollection;
		nick: aString;
		defaults: aPassword;
		yourself
