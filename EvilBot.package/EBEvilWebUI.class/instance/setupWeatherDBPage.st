accessing
setupWeatherDBPage
	self pot GET: '/evildb' -> self weatherData.
	