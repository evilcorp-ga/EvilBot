accessing
loadStyleOn: stream
	stream nextPutAll: '
	<style>
		div { 
		display: inline-block;
		vertical-align: top;
		 }
		div#data { 
		max-width: 50%;
		white-space: nowrap;
		}
		input { 
		width:500px;
		min-width:500px;
		max-width:500px }
	</style>'