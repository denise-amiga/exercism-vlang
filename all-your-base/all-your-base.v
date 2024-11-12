module main

import math

fn rebase(input_base int, digits []int, output_base int) ![]int {
	if input_base < 2 {
		return error('input base must be >= 2')
	}
	if output_base < 2 {
		return error('output base must be >= 2')
	}
	if digits.any(it < 0 || it >= input_base) {
		return error('all digits must satisfy 0 <= d < input base')
	}
	if digits.all(it == 0) {
		return [0]
	}
	mut res := []int{}
	mut num := 0
	for i, n in digits.reverse() {
		num += n * int(math.pow(input_base, i))
	}
	for num > 0 {
		res << num % output_base
		num /= output_base
	}
	return res.reverse()
}
