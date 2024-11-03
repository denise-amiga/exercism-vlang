module main

fn encode(msg string, rails int) string {
	mut r := [][]u8{len: rails, init: []u8{}}
	mut d := -1
	mut i := 0
	for c in msg {
		if c == ` ` {
			continue
		}
		if i == rails - 1 || i == 0 {
			d = -d
		}
		r[i] << c
		i += d
	}
	return r.map(it.bytestr()).join('')
}

fn decode(msg string, rails int) string {
	mut res := []u8{cap: rails}
	mut r := [][]u8{cap: rails}
	mut cnt := []u8{len: rails}
	mut d := -1
	mut i := 0
	for c in msg {
		if c == ` ` {
			continue
		}
		if i == rails - 1 || i == 0 {
			d = -d
		}
		cnt[i]++
		i += d
	}
	i = 0
	for c in 0 .. rails {
		r << msg[i..i + cnt[c]].bytes()
		i += cnt[c]
	}
	i = 0
	d = -1
	for _ in 0 .. msg.len {
		if i == rails - 1 || i == 0 {
			d = -d
		}
		res << r[i][0]
		r[i].delete(0)
		i += d
	}
	return res.bytestr()
}
