module main

fn score(word string) int {
	mut res := 0
	for c in word.to_upper() {
		match c {
			`A`, `E`, `I`, `O`, `U`, `L`, `N`, `R`, `S`, `T` { res += 1 }
			`D`, `G` { res += 2 }
			`B`, `C`, `M`, `P` { res += 3 }
			`F`, `H`, `V`, `W`, `Y` { res += 4 }
			`K` { res += 5 }
			`J`, `X` { res += 8 }
			`Q`, `Z` { res += 10 }
			else { error('Error.')}
		}
	}
	return res
}
