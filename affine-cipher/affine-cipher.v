module main

struct Key {
	a int
	b int
}

fn encode(phrase string, key Key) !string {
	if key.a % 2 == 0 || key.a % 13 == 0 {
		return error('encode with a not coprime to m should return an error')
	}
	mut res := []u8{}
	mut m := 0
	for c in phrase {
		match c {
			`a`...`z` {
				res << (((key.a * (c - `a`)) + key.b) % 26) + `a`
			}
			`A`...`Z` {
				res << (((key.a * (c - `A`)) + key.b) % 26) + `a`
			}
			`0`...`9` {
				res << c
			}
			else {
				continue
			}
		}
		m++
		if m % 5 == 0 {
			res << ` `
		}
	}
	if res.last() == ` ` {
		res.delete_last()
	}
	return res.bytestr()
}

fn decode(phrase string, key Key) !string {
	if key.a % 2 == 0 || key.a % 13 == 0 {
		return error('decode with a not coprime to m should return an error')
	}
	mut res := []u8{}
	mut i := 0
	for i < 27 {
		r := (key.a * i) % 26
		if r == 1 {
			break
		}
		i++
	}
	for c in phrase {
		match c {
			`a`...`z` {
				y := (i * (c - 97 - key.b) % 26) + 97
				res << if y < 97 { u8(y + 26) } else { u8(y) }
			}
			`0`...`9` {
				res << c
			}
			else {
				continue
			}
		}
	}
	return res.bytestr()
}
