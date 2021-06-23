Object subclass: SmallestDivisor [
| n |

"initialization"
setN: a1 [
    n := a1.
]


"class methods"
SmallestDivisor class >> withN: aNumber  [
    ^ SmallestDivisor new setN: aNumber.
]

SmallestDivisor class >> dividesA: a B: b [
    ^ 0 == (b rem: a).
]

SmallestDivisor class >> findDivisorForN: n andTest: test [
    (test * test > n)
        ifTrue: [ ^ n ].

    (self dividesA: test B: n)
        ifTrue: [ ^ test ].

    ^ self findDivisorForN: n andTest: test + 1.
]


"instance methods"
value [
    ^ self class findDivisorForN: n andTest: 2.
]

] "end class"


| test |
test := (SmallestDivisor new setN: 199) value.
test printNl.

test := (SmallestDivisor new setN: 1999) value.
test printNl.

test := (SmallestDivisor new setN: 19999) value.
test printNl.

