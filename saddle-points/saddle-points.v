module main

struct Point {
	row    int
	column int
}

fn mark_rows(m [][]int) map[string]Point {
	h := m.len
	w := m[0].len
	mut res := map[string]Point{}
	for y in 0 .. h {
		mut max_r := min_int
		mut tmp := map[int][]int{}
		for x in 0 .. w {
			t := m[y][x]
			tmp[t] << x
			if t > max_r {
				max_r = t
			}
		}
		for x in tmp[max_r] {
			res['${y},${x}'] = Point{y + 1, x + 1}
		}
	}
	return res
}

fn mark_cols(m [][]int) map[string]Point {
	h := m.len
	w := m[0].len
	mut res := map[string]Point{}
	for x in 0 .. w {
		mut min_c := max_int
		mut tmp := map[int][]int{}
		for y in 0 .. h {
			t := m[y][x]
			tmp[t] << y
			if t < min_c {
				min_c = t
			}
		}
		for y in tmp[min_c] {
			res['${y},${x}'] = Point{y + 1, x + 1}
		}
	}
	return res
}

fn saddle_points(matrix [][]int) []Point {
	mut res := []Point{}
	if matrix.len == 0 || matrix[0].len == 0 {
		return res
	}
	rows := mark_rows(matrix)
	cols := mark_cols(matrix)
	for k, v in rows {
		if k in cols {
			res << v
		}
	}
	return res
}
