module main

@[direct_array_access]
fn is_valid(q1 string, q2 string) !bool {
	p1 := q1.bytes()
	p2 := q2.bytes()
	c1 := if p1[0] < p2[0] { p2[0] - p1[0] } else { p1[0] - p2[0] }
	c2 := if p1[1] < p2[1] { p2[1] - p1[1] } else { p1[1] - p2[1] }
	return match true {
		p1[0] < `a` || p1[0] > `h` || p1[1] < `1` || p1[1] > `8` { error('${q1} is not a valid square') }
		p2[0] < `a` || p2[0] > `h` || p2[1] < `1` || p2[1] > `8` { error('${q2} is not a valid square') }
		q1 == q2 { error('queens on same square') }
		p1[0] == p2[0] || p1[1] == p2[1] || c1 == c2 { true }
		else { false }
	}
}

fn can_queen_attack(white string, black string) !bool {
	if white.len != 2 {
		return error('${white} is not a valid square')
	}
	if black.len != 2 {
		return error('${black} is not a valid square')
	}
	return is_valid(white, black)
}
