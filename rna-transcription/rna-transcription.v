module main

fn to_rna(dna string) string {
	mut res := []u8{cap: dna.len}
	for c in dna {
		match c {
			`G` { res << `C` }
			`C` { res << `G` }
			`T` { res << `A` }
			`A` { res << `U` }
			else { continue }
		}
	}
	return res.bytestr()
}
