module main

import math

fn is_prime(num int) bool {
	limit := math.sqrti(num) + 1
	if num % 2 == 0 {
		return num == 2
	}
	mut p := 3
	for p < limit {
		if num % p == 0 {
			return false
		}
		p += 2
	}
	return true
}

fn nth_prime(n int) !int {
	match true {
		n <= 0 {
			return error('n must be greater than 0')
		}
		n == 1 {
			return 2
		}
		n == 2 {
			return 3
		}
		else {
			mut res := 0
			mut p := 3
			mut l := 1
			for l < n {
				if is_prime(p) {
					res = p
					l++
				}
				p += 2
			}
			return res
		}
	}
}
