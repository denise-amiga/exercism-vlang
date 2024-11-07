module main

enum Command as u8 {
	wink
	double_blink
	close_your_eyes
	jump
}

pub fn commands(encoded_message int) []Command {
	mut res := []Command{}
	for b in 0 .. 4 {
		if encoded_message & (1 << b) != 0 {
			res << Command.from(b) or { panic(err) }
		}
	}
	return if encoded_message & (1 << 4) != 0 { res.reverse() } else { res }
}
