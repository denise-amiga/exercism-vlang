module main

fn square_root(radicand u64) u64 {
	mut l := u64(0)
	mut r := radicand
	for l <= r {
		mut m := (l + r) >> 1
		v := m * m
		if v == radicand {
			return m
		}
		if v < radicand {
			l = m + 1
		} else {
			r = m - 1
		}
	}
	return r
}
