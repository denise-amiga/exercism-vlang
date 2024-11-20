module main

import arrays { max, reduce, window }

fn largest_product(digits string, span int) !int {
	if span == 0 {
		return 1
	} else if span < 0 {
		return error('span must not be negative')
	} else if digits.len < span {
		return error('span must be smaller than string length')
	} else if digits.bytes().any(!it.is_digit()) {
		return error('digits input must only contain digits')
	}
	mut nums := digits.bytes().map(int(it - u8(`0`)))
	return max(window(nums, size: span).map(reduce(it, fn (a int, b int) int {
		return a * b
	})!))!
}
