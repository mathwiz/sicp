Object subclass: Args [
| vals |
setA: a1 B: a2 P: a3 Q: a4 [
    vals := OrderedCollection new.
    vals add:a1; add:a2; add:a3; add:a4.
    ^self
]

getA [ ^ vals at: 1 ]
getB [ ^ vals at: 2 ]
getP [ ^ vals at: 3 ]
getQ [ ^ vals at: 4 ]

] "end Args"

sq := [ :x | x * x ].

even := [ :x | (x rem: 2) == 0 ].

fib_iter := [ :vals :count |
count == 0
ifTrue: [ vals getB ]
ifFalse: [ maintain_invariant value: vals value: count ]
].

maintain_invariant := [ :vals :count |
|a b p q|
a := vals getA.
b := vals getB.
p := vals getP.
q := vals getQ.

(even value: count)
ifTrue: [ fib_iter value: ( (Args new) setA:a B:b P:((sq value:p) + (sq value:q)) Q:((sq value:q) + (2*p*q)) ) value: (count/2) ]
ifFalse: [ fib_iter value: ( (Args new) setA:((b*q) + (a*q) + (a*p)) B:((b*p) + (a*q)) P:p Q:q ) value: (count-1) ]
].

fib := [ :n | 
args := Args new. 
args setA:1 B:0 P:0 Q:1.
fib_iter value: args value: n ].



| test |
test := (OrderedCollection new) add:1; add:0; add:0; add:1; yourself.
(test at:1) printNl.

test := Args new.
test setA:1 B:1 P:2 Q:3.
(test getA) printNl.


((fib value: 0) == 0) printNl.
((fib value: 1) == 1) printNl.
((fib value: 2) == 1) printNl.
((fib value: 3) == 2) printNl.
((fib value: 4) == 3) printNl.
((fib value: 5) == 5) printNl.
((fib value: 6) == 8) printNl.
((fib value: 7) == 13) printNl.
((fib value: 8) == 21) printNl.
((fib value: 9) == 34) printNl.
((fib value: 11) == 89) printNl.
((fib value: 12) == 144) printNl.
((fib value: 13) == 233) printNl.
((fib value: 14) == 377) printNl.
((fib value: 15) == 610) printNl.


