module main

fn valid(value string) bool {
	mut r := 0
	mut i := value.len
	mut p := 0
	for i > 0 {
		i--
		c := value[i] - 48
		if c == 240 { continue }
		if c < 0 || c > 9 { return false}
		p++
		r += c
		if p % 2 == 0 {
			r += c
			if c + c > 9 {
				r -= 9
			}
		}
	}
	return r % 10 == 0 && p > 1
}
