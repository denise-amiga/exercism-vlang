module main

pub fn find(array []int, value int) !int {
	mut l := 0
	mut r := array.len - 1
	for l <= r {
		mut m := (l + r) >> 1
		v := array[m]
		if v == value {
			return m
		}
		if v < value {
			l = m + 1
		} else {
			r = m - 1
		}
	}
	return error('value not in array')
}
