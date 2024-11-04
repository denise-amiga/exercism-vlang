module main

struct Palindrome {
	value   ?int
	factors [][]int
}

fn is_palindrome(num int) bool {
	t := num.str()
	l := t.len
	for i in 0 .. l >> 1 {
		if t[i] != t[l - i - 1] {
			return false
		}
	}
	return true
}

fn smallest(min int, max int) !Palindrome {
	if min > max {
		return error('min must be <= max')
	}
	mut r := map[int][][]int{}
	mut mr := max_int
	for a in min .. max + 1 {
		for b in a .. max + 1 {
			m := a * b
			if !is_palindrome(m) {
				continue
			}
			if m < mr {
				mr = m
			}
			if m !in r {
				r[m] = []
			}
			r[m] << [a, b]
		}
	}
	return Palindrome{if mr == max_int { none } else { mr }, r[mr]}
}

fn largest(min int, max int) !Palindrome {
	if min > max {
		return error('min must be <= max')
	}
	mut r := map[int][][]int{}
	mut mr := min_int
	for a in min .. max + 1 {
		for b in a .. max + 1 {
			m := a * b
			if !is_palindrome(m) {
				continue
			}
			if m > mr {
				mr = m
			}
			if m !in r {
				r[m] = []
			}
			r[m] << [a, b]
		}
	}
	return Palindrome{if mr == min_int { none } else { mr }, r[mr]}
}
