initialization
isValidUrl: aString
| aUrl |
(aString includesSubstring: ' ') ifTrue: [ ^false ].
[aUrl := ZnUrl fromString: aString] on: Error do: [:ex | ^false ].
^(aUrl hasScheme) & (aUrl hasHost)