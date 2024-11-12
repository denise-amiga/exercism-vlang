module main

@[direct_array_access]
fn abbreviate(phrase string) string {
	mut buf := phrase.replace_each(['-', ' ', '_', '']).fields()
	mut res := []u8{cap: buf.len}
	for s in buf {
		res << s[0].ascii_str().to_upper()[0]
	}
	return res.bytestr()
}
