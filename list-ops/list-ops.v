module main

pub fn append[T](front []T, back []T) []T {
	mut res := front.clone()
	for e in back {
		res << e
	}
	return res
}

pub fn concat[T](array [][]T) []T {
	mut res := []T{}
	for row in array {
		for e in row {
			res << e
		}
	}
	return res
}

pub fn foldl[T, U](array []T, initial U, folder fn (acc U, e T) U) U {
	mut res := initial
	for e in array {
		res = folder(res, e)
	}
	return res
}

pub fn foldr[T, U](array []T, initial U, folder fn (acc U, e T) U) U {
	mut res := initial
	l := array.len
	for i in 0 .. l {
		res = folder(res, array[l - i - 1])
	}
	return res
}

pub fn length[T](array []T) int {
	return array.len
}

pub fn reverse[T](array []T) []T {
	l := array.len
	mut res := []T{len: l}
	for i, e in array {
		res[l - i - 1] = e
	}
	return res
}

pub fn filter[T](array []T, predicate fn (e T) bool) []T {
	mut res := []T{cap: array.len}
	for e in array {
		if predicate(e) {
			res << e
		}
	}
	return res
}

// renamed 'map_of' as 'map' conflicts with V 'map' datatype

pub fn map_of[T, U](array []T, mapper fn (e T) U) []U {
	mut res := []U{cap: array.len}
	for e in array {
		res << mapper(e)
	}
	return res
}
