accessing
loadScriptOn: stream
	stream nextPutAll: '
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		function loadLocation(anID){
			$("#data").empty();
			$.get("/evildb/"+anID, function(d){ data = d });
			$("#data").html( data )
		}
	</script>'