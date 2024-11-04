module main

// reverse_string returns a given string in reverse order
fn reverse_string(str string) string {
	l := str.len
	mut res := []u8{len: l}
	for p in 0 .. l + 1 >> 1 {
		res[p] = str[l - p - 1]
		res[l - p - 1] = str[p]
	}
	return res.bytestr()
}
