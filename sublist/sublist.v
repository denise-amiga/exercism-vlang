module main

enum Relation {
	equal
	sublist
	superlist
	unequal
}

fn compare(list_one []int, list_two []int) Relation {
	l1 := list_one.len
	l2 := list_two.len
	if l1 == 0 {
		if l2 == 0 {
			return .equal
		} else {
			return .sublist
		}
	} else {
		if l2 == 0 {
			return .superlist
		}
	}
	if l1 == l2 {
		for i, e in list_one {
			if list_two[i] != e {
				return .unequal
			}
		}
		return .equal
	} else if l1 < l2 {
		for i in 0 .. l2 - l1 + 1 {
			if list_two[i..i + l1] == list_one {
				return .sublist
			}
		}
		return .unequal
	} else {
		for i in 0 .. l1 - l2 + 1 {
			if list_one[i..i + l2] == list_two {
				return .superlist
			}
		}
		return .unequal
	}
	return .unequal
}
