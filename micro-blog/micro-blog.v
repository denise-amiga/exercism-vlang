module main

fn truncate(phrase string) string {
	r := phrase.runes()
	if r.len <= 5 {
		return r.string()
	}
	return r[..5].string()
}
