module main

fn distance(a string, b string) !int {
	mut res := 0
	if a.len != b.len {
		return error('lengths must match!')
	}
	for i in 0 .. a.len {
		if a[i] != b[i] {
			res++
		}
	}
	return res
}
