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
        (times == 0) ifTrue: [ true ] 
                     ifFalse: [ (self fermatTest: n) ifTrue: [ iter value: (times - 1) ]
                                                     ifFalse: [ false ] ]
    ].

    ^ iter value: 20.
]

FastPrime class >> fermatTest: n [
    | try_it |
    try_it := [ :a | (self expmodForBase: a Exp: n M: n) == a  ].
    ^ try_it value: 1 + ((1 to: (n - 1)) atRandom).
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

FastPrime subclass: Carmichael [
value [
    | try_it |
    try_it := [ :a | (self class expmodForBase: a Exp: N M: N) == a  ].
    ^ (self class isPrime: N)
        ifTrue:  [ false ]
        ifFalse: [ self class iterate: (N-1) withBlock: try_it ]
]

Carmichael class >> isPrime: n [
    ^ (SmallestDivisor new setN: n; value) == n
]

Carmichael class >> iterate: n withBlock: aBlock [
    ^ (n == 0)
        ifTrue: [ true ]
        ifFalse: [ (aBlock value: n)
                       ifTrue:  [ self iterate: (n-1) withBlock: aBlock ]
                       ifFalse: [ false ]
                 ]
]
] "Carmichael"


| test_case prime fast_prime carmichael |

prime := [ :x | Carmichael isPrime: x ].

fast_prime := [ :x | FastPrime new setN: x; value ].

carmichael := [ :x | Carmichael new setN: x; value ].

test_case := [ :x | 'n:' display. 
                    x display. 
                    '  Prime:' display. 
                    (prime value: x) display.
                    '  Fast Prime:' display. 
                    (fast_prime value: x) display.
                    '  Carmichael:' display. 
                    (carmichael value: x) display.
                    '' displayNl. ].

test_case value: 10.
test_case value: 7.
test_case value: 11.
test_case value: 97.
test_case value: 499.
test_case value: 561.
test_case value: 1105.
test_case value: 1729.
test_case value: 2465.
test_case value: 2821.
test_case value: 6601.

'done' displayNl.
