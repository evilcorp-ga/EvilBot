initialization
authorizedUsers
	^authorizedUsers ifNil: [ authorizedUsers := self class defaultAuthorizedUsers. authorizedUsers ]