module main

fn set(txt string) map[rune]int {
	mut res := map[rune]int{}
	for c in txt.runes() {
		res[c]++
	}
	return res
}

fn find_anagrams(subject string, candidates []string) []string {
	s := set(subject.to_lower())
	return candidates.filter(set(it.to_lower()) == s && it.to_lower() != subject.to_lower())
}
