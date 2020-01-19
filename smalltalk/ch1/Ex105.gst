| p test |
p := [ p value ].

test := [ :x :y | (x == 0) ifTrue: [0] ifFalse: [y] ].

(test value: 1 value: 2) printNl.
(test value: 0 value: 2) printNl.

"This blows up"
"(test value: 0 value: (p value)) printNl."

"done" printNl.


