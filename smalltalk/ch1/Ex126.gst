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



Object subclass: PrimeSearch [
| start end |
setStart: a1 End: a2 [
    start := a1.
    end := a2.
]

"class methods"
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


"instance methods"
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

searchHelperForN: n andEnd: end [
    (n <= end)
        ifTrue: [ self reportPrime: n. 
                  ^ self searchHelperForN: n + 2 andEnd: end.
        ]
        ifFalse: [ 'finished' displayNl. 
                   ^ self.
        ]
]

] "end class"


| test |


test := (PrimeSearch new setStart: 1000 End: 1020).
test search.
'' displayNl.

test := (PrimeSearch new setStart: 10000 End: 10040).
test search.
'' displayNl.

test := (PrimeSearch new setStart: 100000 End: 100080).
test search.
'' displayNl.

