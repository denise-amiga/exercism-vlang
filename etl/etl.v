module main

fn transform(legacy map[int][]rune) map[rune]int {
	mut res := map[rune]int{}
	for k, v in legacy {
		for vv in v {
			res[vv.to_lower()] = k
		}
	}
	return res
}
