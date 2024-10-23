module main

fn triplets_with_sum(n int) [][]int {
	mut res := [][]int{}
	for a in 1 .. n / 3 + 1 {
		for b in a + 1 .. n * 2 / 3 + 1 {
			c := n - (a + b)
			if a * a + b * b == c * c {
				res << [a, b, c]
			}
		}
	}
	return res
}
