module main

struct HighScores {
	data []int
}

// build a new HighScores
pub fn HighScores.new(scores []int) HighScores {
	return HighScores{
		data: scores
	}
}

pub fn (mut high_scores HighScores) scores() []int {
	return high_scores.data
}

pub fn (mut high_scores HighScores) latest() int {
	return high_scores.data.last()
}

pub fn (mut high_scores HighScores) personal_best() int {
	mut res := min_int
	for i in high_scores.data {
		if i > res {
			res = i
		}
	}
	return res
}

pub fn (mut high_scores HighScores) personal_top_three() []int {
	l := if high_scores.data.len < 3 { high_scores.data.len } else { 3 }
	return high_scores.data.sorted(b < a)[..l]
}
