Object subclass: Ex108 [

cbrt: aNumber [
	^ self class CbrtIter: 1.0e to: aNumber
]

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "

Ex108 class >> Improve: guess To: target [
	^ (target / (guess * guess) + (2 * guess)) / 3.0e
]

Ex108 class >>
CbrtIter: guess to: target [
	| good improvement |
	good := self GoodEnough: guess to: target withFunction: [:x|x*x*x].
	improvement := self Improve: guess To: target.
	^ good
		ifTrue: [ guess ]
		ifFalse: [ self CbrtIter: improvement to: target ]
]

Ex108 class >>
GoodEnough: x to: goal withFunction: f [
	^ ((f value:x) - goal) abs < (x / 100000.0e)
]

Ex108 class >>
Cube: aNumber [
	^ aNumber * aNumber * aNumber
]

] "Ex108"


| test |
test := Ex108 new.
(test cbrt: 8.0e) printNl.
(test cbrt: 27.0e) printNl.
(test cbrt: 10.0e) printNl.
