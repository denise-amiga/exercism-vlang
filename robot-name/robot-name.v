module main

import rand

struct Robot {
mut:
	name string
}

fn generate_name(mut robots map[string]bool) string {
	mut n := []u8{len: 5}
	mut t := ''
	for {
		n[0] = `A` + rand.u32n(26) or {}
		n[1] = `A` + rand.u32n(26) or {}
		n[2] = `0` + rand.u32n(10) or {}
		n[3] = `0` + rand.u32n(10) or {}
		n[4] = `0` + rand.u32n(10) or {}
		t = n.bytestr()
		if t in robots {
			continue
		}
		robots[t] = true
		break
	}
	return t
}

fn create_robot_storage() map[string]bool {
	return map[string]bool{}
}

fn create_robot(mut robots map[string]bool) Robot {
	return Robot{
		name: generate_name(mut robots)
	}
}

fn (mut r Robot) reset(mut robots map[string]bool) {
	r.name = generate_name(mut robots)
}
