even := [ :x | (x rem: 2) == 0 ].

(even value: 1) printNl.
(even value: 2) printNl.

mult_inv := [ :a :b :acc |
b == 0 
ifTrue: [ acc ] 
ifFalse: [ maintain_invariant value: a value: b value: acc ]
].

maintain_invariant := [ :a :b :acc |
(even value: b) 
ifTrue: [ mult_inv value: (a*2) value: (b/2) value: acc ]
ifFalse: [ mult_inv value: a value: (b-1) value: (acc+a) ]
].

mult := [ :a :b | mult_inv value: a value: b value: 0 ].

(mult value: 5 value: 6) printNl.
(mult value: 5 value: 12) printNl.
(mult value: 7 value: 7) printNl.
(mult value: 7 value: 8) printNl.
(mult value: 7 value: 9) printNl.
(mult value: 7 value: 10) printNl.
