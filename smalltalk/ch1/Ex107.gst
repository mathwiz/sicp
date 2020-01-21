FileStream fileIn: 'Ex106.gst'.

Ex106 subclass: Ex107 [
|factor|

setFactor: num [
    factor := num
]

"Override"
sqrt: num [
	| average improve is_good_enough sqrt_iter |
	average := [ :a :b | (a + b) / 2.0e ].
	improve := [ :guess :t | average value: guess value: t / guess ].
	is_good_enough := [ :guess :t | (guess * guess - t) abs < (guess / factor) ].
	sqrt_iter := [ :guess :t | 
	(is_good_enough value: guess value: t)
		ifTrue: [guess]
		ifFalse: [(sqrt_iter value: (improve value: guess value: t) value: t)] ].
	^ sqrt_iter value: 1.0e value: num
]


"Defer to superclass"
sqrtAlt: num [
	^ self sqrtIter: 1.0e to: num
]


"Class method"
Ex107 class >> factor: num [
    ^ (super new) setFactor: num
]


] "Ex107"


'Testing Ex107' printNl.

| test factor |

factor := 100000e0.
test := Ex107 factor: factor.

(test sqrt: 9.0e) printNl.
(test sqrt: 2.0e) printNl.
(test sqrt: 25.0e) printNl.

(test sqrtAlt: 9.0e) printNl.
(test sqrtAlt: 2.0e) printNl.
(test sqrtAlt: 25.0e) printNl.
