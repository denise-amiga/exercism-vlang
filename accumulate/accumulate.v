module main

fn accumulate_ints(values []int, operation fn (int) int) []int {
	mut res := []int{cap: values.len}
	for n in values {
		res << operation(n)
	}
	return res
}

fn accumulate_strs(values []string, operation fn (string) string) []string {
	mut res := []string{cap: values.len}
	for n in values {
		res << operation(n)
	}
	return res
}

// Because V functions cannot be overloaded[1], make another function
//  called `accumulate_strs` that does the same thing for strings
// instead of ints

fn accumulate[T](values []T, operation fn (T) T) []T {
	mut res := []T{cap: values.len}
	for n in values {
		res << operation(n)
	}
	return res
}
