module main

import arrays { window }

fn slices(series string, slice_length int) ![]string {
	if series.len == 0 {
		return error('series cannot be empty')
	} else if slice_length > series.len {
		return error('slice length cannot be greater than series length')
	} else if slice_length == 0 {
		return error('slice length cannot be zero')
	} else if slice_length < 0 {
		return error('slice length cannot be negative')
	}
	return window(series.bytes(), size: slice_length).map(it.bytestr())
}
