module main

enum Allergen as u8 {
	eggs
	peanuts
	shellfish
	strawberries
	tomatoes
	chocolate
	pollen
	cats
}

fn allergic_to(allergen Allergen, score u8) bool {
	return (score & (1 << int(allergen))) == (1 << int(allergen))
}

fn list(score u8) []Allergen {
	mut res := []Allergen{}
	for a in 0 .. 8 {
		if (score & (1 << a)) == (1 << a) {
			res << Allergen.from(a) or { panic(err) }
		}
	}
	return res
}
