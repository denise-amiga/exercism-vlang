module main

fn response(hey_bob string) string {
	buf := hey_bob.trim_space().bytes()
	is_question := buf.len > 0 && buf.last() == `?`
	letters := buf.filter(it.is_letter())
	all_uppers := letters.len > 0 && letters.all(it.ascii_str().is_upper())
	return match true {
		all_uppers && is_question { "Calm down, I know what I'm doing!" }
		all_uppers { 'Whoa, chill out!' }
		is_question { 'Sure.' }
		buf.len == 0 { 'Fine. Be that way!' }
		else { 'Whatever.' }
	}
}
