module main

fn two_fer(name string) string {
	mut res := if name.len > 0 { name } else { 'you' }
	return 'One for ${res}, one for me.'
}
