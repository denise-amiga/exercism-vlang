module main

fn egg_count(number int) int {
	mut res := 0
	mut n := number
	for n > 0 {
		res += n & 1
		n >>= 1
	}
	return res
}
