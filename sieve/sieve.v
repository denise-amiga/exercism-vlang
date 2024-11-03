module main

fn sieve(limit int) []int {
	mut res := []int{}
	mut s := []bool{len: limit + 1, init: true}
	s[0] = false
	s[1] = false
	for i in 1 .. limit + 1 {
		if s[i] {
			for j := i * i; j <= limit; j += i {
				s[j] = false
			}
		}
	}
	for i, p in s {
		if p {
			res << i
		}
	}
	return res
}
