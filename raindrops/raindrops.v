module main

fn raindrops(number int) string {
	mut res := ''
	mut rem := []bool{len: 3}
	rem[0] = number % 3 == 0
	rem[1] = number % 5 == 0
	rem[2] = number % 7 == 0
	if rem[0] {
		res += 'Pling'
	}
	if rem[1] {
		res += 'Plang'
	}
	if rem[2] {
		res += 'Plong'
	}
	if rem.all(it == false) {
		res += number.str()
	}
	return res
}
