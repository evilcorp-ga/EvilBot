accessing
adminAddAdmin: aCmd withArray: anArray to: aLoc
	| anAdmin |
	((aCmd substrings: ' ') size = 2)
		ifTrue: [ 
			anAdmin := (aCmd substrings: ' ') last.
			self authorizedUsers add: anAdmin ]