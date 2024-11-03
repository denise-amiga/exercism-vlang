module main

const pa = {
	'Mercury': 0.2408467,
	'Venus':   0.61519726,
	'Earth':   1.0,
	'Mars':    1.8808158,
	'Jupiter': 11.862615,
	'Saturn':  29.447498,
	'Uranus':  84.016846,
	'Neptune': 164.79132
}

fn age(seconds f64, planet string) !f64 {
	if planet !in pa {
		return error('IError')
	}
	return seconds / (3600 * 24) / (365.25 * pa[planet])
}
