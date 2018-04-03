rendering
style
	^'
body { 
	font-size: 10px;
	font-family: sans-serif;
	color: white;
	background-color: black;
	}
	
li { cursor: pointer; }
#logs { line-height: 0 }
#menu li { 
	display: inline;
	padding-left: 10px;
	padding-right: 10px;
	border: 1px solid black;
	cursor: pointer;
	}

#list { width: 15% }
.key { width: 100px; }

#list ul:first-child { 
	height: 500px;
	max-height: 500px;
	min-height: 500px;
	overflow: scroll;
	}

.responses, .responses input[type=text] { width: 80%; display: inline}
.responses button { display: inline-block }
.cities { display: none }
#content, #list{ vertical-align: top; width: 50% }
#content table { width: 100% }
'