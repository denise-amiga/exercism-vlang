module main

fn suma[T](a []T) int {
	mut r := 0
	for c in a {
		r += c
	}
	return r
}

fn luhn(mut a []u8) {
	if a.len > 1 {
		for i, mut c in a {
			if i % 2 == 1 {
				c *= 2
				if c > 9 {
					c -= 9
				}
			}
		}
	}
}

fn valid(value string) bool {
	mut n := []u8{}
	for c in value {
		if c == ` ` { continue }
		if c.is_digit() {
			n << c - 48
		} else {
			return false
		}
	}
	if n.len == 1 && n[0] == 0 { return false }
	n.reverse_in_place()
	luhn(mut n)
	return suma(n) % 10 == 0
}
