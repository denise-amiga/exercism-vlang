module main

fn score(word string) int {
	mut res := 0
	for c in word.to_upper() {
		res += match c {
			`A`, `E`, `I`, `O`, `U`, `L`, `N`, `R`, `S`, `T` { 1 }
			`D`, `G` { 2 }
			`B`, `C`, `M`, `P` { 3 }
			`F`, `H`, `V`, `W`, `Y` { 4 }
			`K` { 5 }
			`J`, `X` { 8 }
			`Q`, `Z` { 10 }
			else { -max_int }
		}
	}
	return res
}
