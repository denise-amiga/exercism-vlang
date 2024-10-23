module main

fn count_nucleotides(strand string) !map[string]int {
	mut res := {
		'A': 0
		'C': 0
		'G': 0
		'T': 0
	}
	for c in strand {
		match c {
			`A` { res['A'] += 1 }
			`C` { res['C'] += 1 }
			`G` { res['G'] += 1 }
			`T` { res['T'] += 1 }
			else { return error('${c.ascii_str()} is not a valid nucleotide!') }
		}
	}
	return res
}
