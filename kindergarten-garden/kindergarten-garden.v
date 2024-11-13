module main

const p = {
	`G`: 'grass'
	`C`: 'clover'
	`R`: 'radishes'
	`V`: 'violets'
}

fn plants(diagram string, student string) []string {
	mut res := []string{}
	d := diagram.split('\n')
	n := (student[0] - `A`) * 2
	for i in 0 .. 2 {
		res << p[d[i][n]]
		res << p[d[i][n + 1]]
	}
	return res
}
