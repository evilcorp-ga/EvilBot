rendering
renderLogLinesOn: h 
					EBEvilBot logs keysDo: [ :e | | anId |
						anId := h nextId.
						h listItem 
							id: anId;
							onClick: (h jQuery class: 'logContent') empty;
							onClick: (h jQuery ajax script: [:s2 | 
									s2 << (s2 jQuery id: anId) append: [ :h2 | 
										h2 div
											id: 'logs';
											class: 'logContent';
											with: [ (EBEvilBot logs at: e) do: [:line | h preformatted: line]]
										] ]);
							with: e. 
					]