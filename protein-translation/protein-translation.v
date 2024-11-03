module main

const condons = {
	'AUG': 'Methionine'
	'UUU': 'Phenylalanine'
	'UUC': 'Phenylalanine'
	'UUA': 'Leucine'
	'UUG': 'Leucine'
	'UCU': 'Serine'
	'UCC': 'Serine'
	'UCA': 'Serine'
	'UCG': 'Serine'
	'UAU': 'Tyrosine'
	'UAC': 'Tyrosine'
	'UGU': 'Cysteine'
	'UGC': 'Cysteine'
	'UGG': 'Tryptophan'
	'UAA': 'STOP'
	'UAG': 'STOP'
	'UGA': 'STOP'
}

fn proteins(strand string) ![]string {
	mut res := []string{}
	mut condon := []u8{cap: 3}
	mut l := 0
	for c in strand {
		match c {
			`U`, `C`, `A`, `G` {
				condon << c
				l++
				if l == 3 {
					l = 0
					t := condons[condon.bytestr()] or { return error('Invalid codon') }
					if t == 'STOP' {
						break
					}
					res << condons[condon.bytestr()]
					condon.clear()
				}
			}
			else {
				return error('Invalid codon')
			}
		}
	}
	if l != 0 {
		return error('Invalid codon')
	}
	return res
}
