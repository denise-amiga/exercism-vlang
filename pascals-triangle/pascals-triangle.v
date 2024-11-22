module main

pub fn rows(height int) [][]int {
	mut res := [][]int{len: height, init: []int{len: index + 1, init: 1}}
	for y in 2 .. height {
		for x in 1 .. res[y].len - 1 {
			res[y][x] = res[y - 1][x - 1] + res[y - 1][x]
		}
	}
	return res
}
