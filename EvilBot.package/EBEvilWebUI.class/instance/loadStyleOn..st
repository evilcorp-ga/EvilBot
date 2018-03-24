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
		.hidden { display: none }
		#list { height: 500px; max-height: 500px; min-height: 500px; overflow: auto }
		ul, li { list-style-type: none; }
		span { margin-left: 10px; margin-right: 10px; }
	</style>'