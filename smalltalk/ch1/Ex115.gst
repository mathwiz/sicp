Object subclass: Ex115 [

cube: x [
	^ x * x * x
]

sine: angle [
	"approximate sine function"

	^ angle abs < 0.01e
		ifTrue: [ angle ]
		ifFalse: [ self p: (self sine: (angle / 3.0e)) ]
]

p: x [
	^ 3 * x - (4 * (self cube: x))
]

] "end Ex115"

| test pi |

test := Ex115 new.
pi := 3.14159e.

(test sine: pi ) printNl.
(test sine: (pi / 2) ) printNl.
(test sine: (pi / 4) ) printNl.


