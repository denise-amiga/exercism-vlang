module main

const bands = [
	'black',
	'brown',
	'red',
	'orange',
	'yellow',
	'green',
	'blue',
	'violet',
	'grey',
	'white',
]

fn value(colors []string) int {
	return bands.index(colors[0]) * 10 + bands.index(colors[1])
}
