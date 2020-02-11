even := [ :x | (x rem: 2) == 0 ].

fib_iter := [ :a :b :p :q :count |
count == 0
ifTrue: [ b ]
ifFalse: [ maintain_invariant value: a value: b value: p value: q value: count ]
].

maintain_invariant := [ :a :b :p :q :count |
(even value: count)
ifTrue: [ fib_iter value: a value: b value: ((p*p) + (q*q)) value: ((q*q) + (2*p*q)) value: count/2 ]
ifFalse: [ fib_iter value: ((b*p) + (a*q) + (a*p)) value: ((b*p) + (a*q)) value: p value: q value: (count-1) ]
].

fib := [ :n | fib_iter value: n ].

((fib value: 0) == 0) printNl.
((fib value: 1) == 1) printNl.
((fib value: 2) == 1) printNl.
((fib value: 3) == 2) printNl.
((fib value: 4) == 3) printNl.
((fib value: 5) == 5) printNl.
((fib value: 6) == 8) printNl.
((fib value: 15) == 610) printNl.
