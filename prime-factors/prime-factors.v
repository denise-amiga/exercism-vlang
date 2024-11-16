module main

fn prime_factors(n i64) []i64 {
	mut primes := []i64{}
	mut num := n
	for num % 2 == 0 {
		primes << 2
		num >>= 1
	}
	mut prime := 3
	for num != 1 {
		if num % prime == 0 {
			primes << prime
			num /= prime
			continue
		}
		prime += 2
	}
	return primes
}
