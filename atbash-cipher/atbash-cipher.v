module main

fn encode(phrase string) string {
	mut res := []u8{}
	mut i := 0
	for c in phrase.to_lower() {
		if c == ` ` || c == `.` || c == `,` {
			continue
		} else if c >= `a` && c <= `z` {
			res << `z` - (c - `a`)
		} else if c >= `0` && c <= `9` {
			res << c
		}
		i++
		if i % 5 == 0 {
			res << ` `
		}
	}
	if res.last() == ` ` {
		res.delete_last()
	}
	return res.bytestr()
}

fn decode(phrase string) string {
	mut res := []u8{}
	for c in phrase.to_lower() {
		if c == ` ` {
			continue
		} else if c >= `a` && c <= `z` {
			res << `a` + (`z` - c)
		} else if c >= `0` && c <= `9` {
			res << c
		}
	}
	return res.bytestr()
}
