class initialization
register
	(WAAdmin register: self asApplicationAt: 'EvilBot')
		addLibrary: JQDeploymentLibrary.
	WAAdmin applicationDefaults
    removeParent: WADevelopmentConfiguration instance