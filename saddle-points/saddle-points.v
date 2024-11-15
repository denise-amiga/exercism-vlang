module main

struct Point {
	row    int
	column int
}

struct MaxMin {
mut:
	max bool
	min bool
}

fn mark_rows(m [][]int, mut mm [][]MaxMin) {
	h := m.len
	w := m[0].len
	if h == 0 || w == 0 {
		return
	}
	mut max_r := min_int
	mut tmp := map[int][]int{}
	for y in 0 .. h {
		max_r = min_int
		tmp.clear()
		for x in 0 .. w {
			t := m[y][x]
			tmp[t] << x
			if t > max_r {
				max_r = t
			}
		}
		for x in tmp[max_r] {
			mm[y][x].max = true
		}
	}
}

fn mark_cols(m [][]int, mut mm [][]MaxMin) {
	h := m.len
	w := m[0].len
	if h == 0 || w == 0 {
		return
	}
	mut min_c := max_int
	mut tmp := map[int][]int{}
	for x in 0 .. w {
		min_c = max_int
		tmp.clear()
		for y in 0 .. h {
			t := m[y][x]
			tmp[t] << y
			if t < min_c {
				min_c = t
			}
		}
		for y in tmp[min_c] {
			mm[y][x].min = true
		}
	}
}

fn saddle_points(matrix [][]int) []Point {
	mut res := []Point{}
	h := matrix.len
	w := matrix[0].len
	if h == 0 || w == 0 {
		return res
	}
	mut mm := [][]MaxMin{len: h, init: []MaxMin{len: w}}
	mark_rows(matrix, mut mm)
	mark_cols(matrix, mut mm)
	for y in 0 .. h {
		for x in 0 .. w {
			if mm[y][x].max && mm[y][x].min {
				res << Point{y + 1, x + 1}
			}
		}
	}
	return res
}
