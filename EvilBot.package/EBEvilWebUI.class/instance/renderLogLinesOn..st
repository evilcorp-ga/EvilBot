rendering
renderLogLinesOn: h 
	| aChan aText  |
		h div style: 'height: 500px; overflow: auto';
			with: [
					EBEvilBot logs keysDo: [ :e | | anId |
						anId := h nextId.
						h listItem 
							id: anId;
							onClick: (h jQuery class: 'logContent') empty;
							onClick: (h jQuery ajax script: [:s2 | 
									s2 << (s2 jQuery id: anId) append: [ :h2 | 
										currLogLine := e.
										h2 div
											id: 'logs';
											class: 'logContent';
											with: [ (EBEvilBot logs at: e) reverse do: [:line | h preformatted: line]]
										] ]);
							with: e. 
					].
		 ].
		(EBEvilBot default channels) isEmpty ifFalse: [ aChan := (EBEvilBot default channels) first ].
		h select
			id: 'chan'; 
			list: (EBEvilBot default channels);
			onChange: (h jQuery ajax callback: [ :val | aChan := val ] value: ( h jQuery: '#chan') value).
		h textInput id: 'text'; placeholder: 'say something'; callback: [ :val | aText := val ].
		h button bePush;
			onClick: (h jQuery: '#logs') empty;
			onClick: ( h jQuery ajax 
				callback: [ :val |  val isEmptyOrNil ifFalse: [ EBEvilBot default sendPrv: val to: ('#',aChan) ] ] 
				value: ( (h jQuery: '#text') value );
				script: [ :s | s << (s jQuery: '#logs')  append: [ :html | (EBEvilBot logs at: currLogLine) reverse do: [:line | html preformatted: line] ] ] );
			onClick: ((h jQuery: '#text') value: '');
			with: 'Say'.