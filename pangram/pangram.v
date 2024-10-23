module main

fn is_pangram(phrase string) bool {
	mut res := map[u8]int{}
	for c in phrase.to_lower() {
		if c == ` ` || c == `_` {
			continue
		}
		if c >= `a` && c <= `z` {
			res[c] += 1
		}
	}
	return res.keys().len == 26
}
