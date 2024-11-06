module main

fn collatz(number int) !int {
	if number <= 0 {
		return error('Error.')
	}
	mut res := 0
	mut n := number
	for n != 1 {
		if n & 1 == 1 {
			n = 3 * n + 1
		} else {
			n >>= 1
		}
		res++
	}
	return res
}
