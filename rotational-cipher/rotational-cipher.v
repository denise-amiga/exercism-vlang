module main

fn rotate(text string, shift_key int) string {
	mut res := []u8{cap: text.len}
	for c in text {
		t := u8(c + shift_key)
		if c >= `a` && c <= `z` {
			res << if t > `z` { t - 26 } else { t }
		} else if c >= `A` && c <= `Z` {
			res << if t > `Z` { t - 26 } else { t }
		} else {
			res << c
		}
	}
	return res.bytestr()
}
