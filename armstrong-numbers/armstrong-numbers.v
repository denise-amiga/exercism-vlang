module main

import math

pub fn is_armstrong_number(number u32) bool {
	p := number.str().len // int(math.log10(number)) + 1
	mut res := 0
	mut n := number
	for n > 0 {
		res += int(math.powi(n % 10, p))
		n /= 10
	}
	return res == number
}
