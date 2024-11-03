module main

pub fn keep[T](array []T, predicate fn (e T) bool) []T {
	mut res := []T{}
	for a in array {
		if predicate(a) {
			res << a
		}
	}
	return res
}

pub fn discard[T](array []T, predicate fn (e T) bool) []T {
	mut res := []T{}
	for a in array {
		if !predicate(a) {
			res << a
		}
	}
	return res
}
