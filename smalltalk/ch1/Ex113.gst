Object subclass: Ex113 [
| n |

setN: anInteger [
	"the Nth Fibonacci number"
	n := anInteger. 
]

eval [
	| retval psi phi sqrt5 |
	sqrt5 := 5e sqrt.
	psi := ((1e + sqrt5) / 2e) raisedToInteger: n.
	phi := ((1e - sqrt5) / 2e) raisedToInteger: n.
	retval := (psi - phi) / sqrt5.
	^ retval rounded
]

] "end Ex113"

| test n sqrt5 psi phi |

n := 3.
sqrt5 := 5e sqrt.
psi := ((1e + sqrt5) / 2e) raisedToInteger: n.
psi printNl.

phi := ((1e - sqrt5) / 2e) raisedToInteger: n.
phi printNl.

test := Ex113 new.

(test setN: 3 ; eval) printNl.
(test setN: 4 ; eval) printNl.
(test setN: 5 ; eval) printNl.
(test setN: 6 ; eval) printNl.
