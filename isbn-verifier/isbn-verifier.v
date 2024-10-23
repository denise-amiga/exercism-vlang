module main

pub fn is_valid(isbn_10 string) bool {
	mut i := 10
	mut res := 0
	for c in isbn_10 {
		if c >= `0` && c <= `9` {
			res += (c - 48) * i
			i -= 1
		} else if c == `x` || c == `X` {
			if i != 1 {
				return false
			}
			res += i * 10
			i -= 1
		} else if c == `-` {
			continue
		} else {
			return false
		}
	}
	return i == 0 && res % 11 == 0
}
