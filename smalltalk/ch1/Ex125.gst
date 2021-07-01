Object subclass: FastExpt [
| b exp |

"initialization"
setB: a1 Exp: a2 [
    b := a1.
    exp := a2.
]


"class methods"
FastExpt class >> square: aNumber  [
    ^ aNumber * aNumber.
]

FastExpt class >> even: aNumber [
    ^ 0 == (aNumber rem: 2).
]


"instance methods"
value [
    (exp == 0)
        ifTrue: [ ^ 1 ].

    (self class even: exp)
        ifTrue: [ ^ self class square: (FastExpt new setB: b Exp: (exp / 2); value) ].

    ^ b * (FastExpt new setB: b Exp: (exp - 1); value).
]

] "end class"



Object subclass: PrimeSearch [
| start end |
setStart: a1 End: a2 [
    start := a1.
    end := a2.
]


"class methods"
PrimeSearch class >> fastExptForB: b Exp: exp [
    (exp == 0)
        ifTrue: [ ^ 1 ].

    (self even: exp)
        ifTrue: [ ^ self square: (self fastExptForB: b Exp: (exp / 2)) ].

    ^ b * (self fastExptForB: b Exp: (exp - 1)).
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
    ^ (self fastExptForB: base Exp: exp) rem: m.
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
(FastExpt new setB: 2 Exp: 8) value displayNl.

"
test := (PrimeSearch new setStart: 1000 End: 1020).
test search.
'' displayNl.

test := (PrimeSearch new setStart: 10000 End: 10040).
test search.
'' displayNl.

test := (PrimeSearch new setStart: 100000 End: 100080).
test search.
'' displayNl.
"
