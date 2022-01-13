Dictionary subclass: SmallestDivisor [

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

value [
    ^ self class findDivisorForN: (self at: #N) andTest: 2.
]

] "end class"



Object subclass: PrimeSearch [
| start end |
setStart: a1 End: a2 [
    start := a1.
    end := a2.
]

PrimeSearch class >> isPrime: n [
    | iter |
    iter := [ :times | 
        (times == 0) ifTrue: [ true ] 
                     ifFalse: [ (self fermatTest: n) ifTrue: [ iter value: (times - 1) ]
                                                     ifFalse: [ false ] ]
    ].

    ^ iter value: 2.
]

PrimeSearch class >> fermatTest: n [
    | try_it |
    try_it := [ :a | (self expmodForBase: a Exp: n M: n) == a  ].
    ^ try_it value: 1 + ((1 to: (n - 1)) atRandom).
]

PrimeSearch class >> expmodForBase: base Exp: exp M: m [
    ^ (exp == 0)
        ifTrue: [ 1 ]
        ifFalse: [ (self even: exp)
                       ifTrue: [ (self square: (self expmodForBase: base Exp: (exp / 2) M: m)) rem: m ]
                       ifFalse: [ (base * (self expmodForBase: base Exp: (exp - 1) M: m)) rem: m ]
        ].
]

PrimeSearch class >> even: n [
    ^ (n rem: 2) == 0.
]

PrimeSearch class >> square: n [
    ^ n * n.
]

search [
    | even n |
    even := [ :x | (x rem: 2) == 0 ].

    n := (even value: start) ifTrue: [ start + 1 ] ifFalse: [ start ].
    self searchHelperForN: n andEnd: end.
]

reportPrime: n [
    (self class isPrime: n)
    ifTrue: [ n display. ' ***' displayNl. ]
    ifFalse: [ n displayNl. ]
]

] "end class"


| test_case prime fast_prime carmichael |

old_prime := [ :x | (SmallestDivisor new setN: x; value) == x ].

prime := [ :x | (SmallestDivisor new; at: #N put: x; value) == x ].

prime := Dictionary new.
prime at: #N put: 11.
(prime at: #N) displayNl.

test_case := [ :x | 'n:' display. 
                    x display. 
                    '  Prime:' display. 
                    "(prime value: x) display."
                    '' displayNl. ].

test_case value: 10.
test_case value: 11.
test_case value: 561.
test_case value: 1105.
test_case value: 1729.
test_case value: 2465.
test_case value: 2821.
test_case value: 6601.

'done' displayNl.

