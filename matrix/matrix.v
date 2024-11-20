module main

fn row(str string, index int) []int {
	mut tmp := str.split('\n')
	return tmp[index - 1].split(' ').map(it.int())
}

fn column(str string, index int) []int {
	mut tmp := str.split('\n')
	return tmp.map(it.split(' ')[index - 1].int())
}
