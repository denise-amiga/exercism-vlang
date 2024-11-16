module main

fn is_paired(input string) bool {
	mut stack := []u8{cap: 20}
	for c in input {
		match c {
			`{`, `[`, `(` {
				stack << c
			}
			`}` {
				if stack.len == 0 || (stack.len > 0 && stack.last() != `{`) {
					return false
				}
				stack.delete_last()
			}
			`]` {
				if stack.len == 0 || (stack.len > 0 && stack.last() != `[`) {
					return false
				}
				stack.delete_last()
			}
			`)` {
				if stack.len == 0 || (stack.len > 0 && stack.last() != `(`) {
					return false
				}
				stack.delete_last()
			}
			else {}
		}
	}
	return stack.len == 0
}
