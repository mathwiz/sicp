Object subclass: NumberFunction [
| N |
setN: aNum [
    N := aNum
]

NumberFunction class >> even: n [
    ^ (n rem: 2) == 0.
]

NumberFunction class >> square: n [
    ^ n * n.
]
] "NumberFunction"

NumberFunction subclass: SmallestDivisor [
value [
    ^ self class findDivisorForN: N andTest: 2.
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
] "SmallestDivisor"


NumberFunction subclass: FastPrime [
value [
    ^self class isPrime: N
]

FastPrime class >> isPrime: n [
    | iter |
    iter := [ :times | 
              (times == 0) or: [ (self fermatTest: n) ifTrue:  [ iter value: (times - 1) ]
                                                      ifFalse: [ false ] ] ].

    ^ iter value: 20.
]

FastPrime class >> fermatTest: n [
    | tryIt |
    tryIt := [ :a | (self expmodForBase: a Exp: n M: n) == a  ].
    ^ tryIt value: 1 + ((1 to: (n - 1)) atRandom).
]

FastPrime class >> expmodForBase: base Exp: exp M: m [
    ^ (exp == 0)
        ifTrue: [ 1 ]
        ifFalse: [ (self even: exp)
                       ifTrue: [ (self square: (self expmodForBase: base Exp: (exp / 2) M: m)) rem: m ]
                       ifFalse: [ (base * (self expmodForBase: base Exp: (exp - 1) M: m)) rem: m ]
        ].
]
] "FastPrime"

FastPrime subclass: MillerRabin [

MillerRabin class >> fermatTest: n [
    | tryIt |
    tryIt := [ :a | (self expmodForBase: a Exp: (n-1) M: n) == 1 ].
    ^ tryIt value: 1 + ((1 to: (n - 1)) atRandom).
]

MillerRabin class >> expmodForBase: base Exp: exp M: m [
    | nontrivialSqrt squaremodWithCheck |

    ^ (exp == 0)
        ifTrue: [ 1 ]
        ifFalse: [ (self even: exp)
                       ifTrue: [ (self square: (self expmodForBase: base Exp: (exp / 2) M: m)) rem: m ]
                       ifFalse: [ (base * (self expmodForBase: base Exp: (exp - 1) M: m)) rem: m ]
        ].
]
] "MillerRabin"

| testCase prime |

prime := [ :x | (SmallestDivisor new setN: x; value) == x ].

testCase  := [ :x | ('n:' , x asString) display.
                    '  Prime:' display. 
                    (prime value: x) display.
                    '  Fast Prime:' display. 
                    (FastPrime new setN: x; value) display.
                    '  Miller-Rabin:' display. 
                    (MillerRabin new setN: x; value) display.
                    '' displayNl. ].

testCase value: 10.
testCase value: 7.
testCase value: 11.
testCase value: 97.
testCase value: 499.
testCase value: 561.
testCase value: 1105.
testCase value: 1729.
testCase value: 2465.
testCase value: 2821.
testCase value: 6601.

'done' displayNl.
