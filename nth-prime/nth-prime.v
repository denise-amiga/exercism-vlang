module main

import math

fn is_prime(num int, mut primes []int) bool {
	limit := math.sqrti(num) + 1
	for p in primes {
		if p > limit {
			break
		}
		if num % p == 0 {
			return false
		}
	}
	return true
}

fn nth_prime(n int) !int {
	if n <= 0 {
		return error('n must be greater than 0')
	}
	mut res := []int{cap: n + 1}
	res << [2, 3, 5, 7]
	mut p := 11
	mut l := 4
	for l < n {
		if is_prime(p, mut res) {
			res << p
			l++
		}
		p += 2
	}
	return res[n - 1]
}
