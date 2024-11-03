module main

fn is_isogram(word string) bool {
	mut m := map[u8]bool{}
	for c in word.to_lower() {
		if c == ` ` || c == `-` {
			continue
		}
		if c in m {
			return false
		}
		m[c] = true
	}
	return true
}
