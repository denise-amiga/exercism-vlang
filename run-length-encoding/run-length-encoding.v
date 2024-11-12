module main

fn encode(str string) string {
	if str.len == 0 {
		return ''
	}
	mut res := ''
	mut last := str[0]
	mut counter := 1
	for c in str[1..] {
		if last == c {
			counter++
			continue
		}
		if counter > 1 {
			res += counter.str()
		}
		res += last.ascii_str()
		last = c
		counter = 1
	}
	if counter > 1 {
		res += counter.str()
	}
	res += last.ascii_str()
	return res
}

fn decode(str string) string {
	if str.len == 0 {
		return ''
	}
	mut res := ''
	mut counter := ''
	for c in str {
		if c.is_digit() {
			counter += c.ascii_str()
			continue
		}
		if c.is_letter() || c.is_space() {
			rep := if counter.len == 0 { 1 } else { counter.int() }
			res += c.ascii_str().repeat(rep)
			counter = ''
		}
	}
	return res
}
