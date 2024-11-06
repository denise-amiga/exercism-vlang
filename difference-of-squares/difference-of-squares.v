module main

pub fn square_of_sum(n u32) u32 {
	mut res := u32(0)
	for i in 1 .. n + 1 {
		res += i
	}
	return res * res
}

pub fn sum_of_squares(n u32) u32 {
	mut res := u32(0)
	for i in 1 .. n + 1 {
		res += i * i
	}
	return res
}

pub fn difference(n u32) u32 {
	return square_of_sum(n) - sum_of_squares(n)
}
