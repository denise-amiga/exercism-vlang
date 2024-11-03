module main

import math

fn sieve(limit i64) []i64 {
	mut res := []i64{}
	mut s := []bool{len: int(limit + 1), init: true}
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

fn prime_factors(n i64) []i64 {
	mut res := []i64{}
	mut m := n
	primes := sieve(int(math.sqrti(n)))
	for p in primes {
		for m % p == 0 {
			res << p
			m /= p
		}
	}
	if m > 1 {
		res << m
	}
	return res
}
