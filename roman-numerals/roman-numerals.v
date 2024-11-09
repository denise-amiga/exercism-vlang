module main

const thousands = {
	1: 'M'
	2: 'MM'
	3: 'MMM'
}

const hundreds = {
	1: 'C'
	2: 'CC'
	3: 'CCC'
	4: 'CD'
	5: 'D'
	6: 'DC'
	7: 'DCC'
	8: 'DCCC'
	9: 'CM'
}

const tens = {
	1: 'X'
	2: 'XX'
	3: 'XXX'
	4: 'XL'
	5: 'L'
	6: 'LX'
	7: 'LXX'
	8: 'LXXX'
	9: 'XC'
}

const units = {
	1: 'I'
	2: 'II'
	3: 'III'
	4: 'IV'
	5: 'V'
	6: 'VI'
	7: 'VII'
	8: 'VIII'
	9: 'IX'
}

fn roman(number int) string {
	mut res := ''
	if th := thousands[(number / 1000) % 10] {
		res += th
	}
	if hu := hundreds[(number / 100) % 10] {
		res += hu
	}
	if te := tens[(number / 10) % 10] {
		res += te
	}
	if un := units[number % 10] {
		res += un
	}
	return res
}
