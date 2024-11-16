module main

fn set(txt string) map[rune]int {
	mut res := map[rune]int{}
	for c in txt.to_lower().runes() {
		res[c]++
	}
	return res
}

fn find_anagrams(subject string, candidates []string) []string {
	s := set(subject)
	return candidates.filter(set(it) == s && it.to_lower() != subject.to_lower())
}
