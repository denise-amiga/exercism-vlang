module main

fn sum(factors []int, limit int) int {
	mut res := 0
	mut set := map[int]u8{}
	for f in factors {
		if f == 0 {
			continue
		}
		mut m := f
		for m < limit {
			set[m]++
			m += f
		}
	}
	for k, _ in set {
		res += k
	}
	return res
}
