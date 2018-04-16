rendering
renderTalkOn: html
	html button
		bePush;
		onClick: (html jQuery ajax script: [:s | s << (s jQuery: '#content') html: [:h | self renderTalkFormOn: h ]]);
		with: 'Say'