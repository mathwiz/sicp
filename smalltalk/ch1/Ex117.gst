even := [ :x | (x rem: 2) == 0 ].

(even value: 1) printNl.
(even value: 2) printNl.

mult_inv := [ :a :b |
b == 0 
ifTrue: [ 0 ]
ifFalse: [ maintain_invariant value: a value: b ]
].

maintain_invariant := [ :a :b |
(even value: b) 
ifTrue: [ 2 * (mult_inv value: a value: (b/2)) ]
ifFalse: [ a + (mult_inv value: a value: (b-1)) ]
].

mult := [ :a :b | mult_inv value: a value: b ].

(mult value: 5 value: 6) printNl.
(mult value: 5 value: 12) printNl.
(mult value: 5 value: 15) printNl.
(mult value: 7 value: 7) printNl.
(mult value: 7 value: 8) printNl.
(mult value: 7 value: 9) printNl.
(mult value: 7 value: 10) printNl.
(mult value: 7 value: 12) printNl.
