module main

fn neighbors(x int, y int, mf []string) u8 {
	h := mf.len
	w := mf[0].len
	mut res := u8(0)
	for vy in -1 .. 2 {
		yv := y + vy
		if yv < 0 || yv >= h {
			continue
		}
		for vx in -1 .. 2 {
			xv := x + vx
			if xv < 0 || xv >= w {
				continue
			}
			if vy == 0 && vx == 0 {
				continue
			}
			if mf[yv][xv] == `*` {
				res++
			}
		}
	}
	return res
}

fn annotate(minefield []string) []string {
	mut res := []string{}
	if minefield == res || minefield == [''] {
		return minefield
	}
	h := minefield.len
	w := minefield[0].len
	for y in 0 .. h {
		mut row := []u8{len: w}
		for x in 0 .. w {
			if minefield[y][x] != `*` {
				c := neighbors(x, y, minefield)
				row[x] = if c == 0 { ` ` } else { c + `0` }
			} else {
				row[x] = `*`
			}
		}
		res << row.bytestr()
	}
	return res
}
