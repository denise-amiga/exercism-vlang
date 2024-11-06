module main

import math

fn score(x f64, y f64) int {
	h := math.sqrt(x * x + y * y)
	if 0 <= h && h <= 1 {
		return 10
	}
	if 1 < h && h <= 5 {
		return 5
	}
	if 5 < h && h <= 10 {
		return 1
	}
	return 0
}
