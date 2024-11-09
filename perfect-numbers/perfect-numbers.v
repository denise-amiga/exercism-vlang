module main

pub enum Number {
	perfect
	abundant
	deficient
}

pub fn classify(candidate int) !Number {
	if candidate <= 0 {
		return error('Classification is only possible for positive integers.')
	}
	mut res := -candidate
	for n in 1 .. candidate {
		if candidate % n == 0 {
			res += n
		}
	}
	return match true {
		res < 0 { .deficient }
		res == 0 { .perfect }
		else { .abundant }
	}
}
