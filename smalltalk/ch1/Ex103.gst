Object subclass: Ex103 [
| x y z |

setX: n1 Y: n2 Z: n3 [
       x := n1.
       y := n2.
       z := n3.
]

largerSumOfSquares [
	"return the sum of the squares of the larger 2 of the internal numbers"

       | ans sumsq |
       sumsq := [ :a :b | (a * a) + (b * b) ].

       ans := x <= y & (x <= z)
       ifTrue: [ sumsq value: y value: z ]
       ifFalse: [ y <= x & (y <= z)
                ifTrue: [ sumsq value: x value: z ]
                ifFalse: [ sumsq value: x value: y ] ].
       ^ans
]

]!


| test |
test := (Ex103 new).

test setX:2 Y:3 Z:4.
test largerSumOfSquares printNl.

test setX:2 Y:3 Z:1.
test largerSumOfSquares printNl.

test setX:2 Y:3 Z:5.
test largerSumOfSquares printNl.

test setX:2 Y:4 Z:5.
test largerSumOfSquares printNl.
