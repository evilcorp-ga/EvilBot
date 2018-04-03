class initialization
register
	(WAAdmin register: self asApplicationAt: 'evilbot')
		addLibrary: JQDeploymentLibrary.
	WAAdmin applicationDefaults
    removeParent: WADevelopmentConfiguration instance

		