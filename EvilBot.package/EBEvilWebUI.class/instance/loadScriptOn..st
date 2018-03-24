accessing
loadScriptOn: stream
	stream nextPutAll: '
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		function showcities(ul){
			$(ul).html() == "+" ? $(ul).html("-") : $(ul).html("+");
			$(ul).next().toggle();
		};
		
		function loadLocation(anID){
			$.get("/evildb/"+anID, function(d){ 
				$("#data").empty();
				$("#data").html( d )
			});
		}
	</script>'