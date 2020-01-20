Object subclass: Ex106 [

sqrt: x [
	| average improve is_good_enough sqrt_iter |
	average := [ :a :b | (a + b) / 2.0 ].
	improve := [ :guess :t | average value: guess value: t / guess ].
	is_good_enough := [ :guess :t | (guess * guess - t) abs < 0.001 ].
	sqrt_iter := [ :guess :t | 
	(is_good_enough value: guess value: t)
		ifTrue: [guess]
		ifFalse: [(sqrt_iter value: (improve value: guess value: t) value: t)] ].
	^ sqrt_iter value: 1.0 value: x
]

sqrtIter: guess to: t [
	| iter good improvement |
	iter := nil.
	iter := [ :nextGuess | 
	good := (GoodEnough new init: t) check: nextGuess withFunction: [ :x | x * x ].
	improvement := ImproveGuessSqrt new improve: nextGuess To: t.
	good
		ifTrue: [ nextGuess ]
		ifFalse: [ iter value: improvement ] ].
	^ iter value: guess
]

sqrtAlt: x [
	^ self sqrtIter: 1.0 to: x
]

] "Ex106"


Object subclass: GoodEnough [
| goal tolerance |

check: x withFunction: f [
       ^ ((f value:x) - goal) abs < tolerance
]


goal [
     ^ goal
]

tolerance [
     ^ tolerance
]

init: x [
	goal := x.
	tolerance := 0.001
]

] "GoodEnough"


Object subclass: ImproveGuessSqrt [

improve: guess To: t [
	"improve a single number guess"
	^ (guess + (t / guess)) / 2.0
]

] "ImproveGuessSqrt"


| test |


test := ImproveGuessSqrt new.
(test improve: 3.0 To: 1.4) printNl.

test := Ex106 new.
"(test sqrt: 9.0) printNl."
"(test sqrt: 2.0) printNl."
"(test sqrt: 25.0) printNl."

