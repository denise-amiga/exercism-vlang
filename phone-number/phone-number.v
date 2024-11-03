module main

fn clean(phrase string) !string {
	mut res := []u8{}
	for c in phrase {
		if c.is_digit() {
			res << c
		} else if c in [` `, `+`, `-`, `(`, `)`, `.`] {
			continue
		} else if c.is_letter() {
			return error('letters not permitted')
		} else {
			return error('punctuations not permitted')
		}
	}
	if res.len <= 9 {
		return error('must not be fewer than 10 digits')
	} else if res.len > 11 {
		return error('must not be greater than 11 digits')
	}
	if res.len == 11 {
		if res[0] != `1` {
			return error('11 digits must start with 1')
		}
		if res[1] == `0` {
			return error('area code cannot start with zero')
		} else if res[1] == `1` {
			return error('area code cannot start with one')
		}
		if res[4] == `0` {
			return error('exchange code cannot start with zero')
		} else if res[4] == `1` {
			return error('exchange code cannot start with one')
		}
	} else if res.len == 10 {
		if res[0] == `0` {
			return error('area code cannot start with zero')
		} else if res[0] == `1` {
			return error('area code cannot start with one')
		}
		if res[3] == `0` {
			return error('exchange code cannot start with zero')
		} else if res[3] == `1` {
			return error('exchange code cannot start with one')
		}
	}
	if res.len == 11 && res[0] == `1` {
		return res[1..].bytestr()
	}
	return res.bytestr()
}
