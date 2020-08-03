Object subclass: Gcd [
| a b |

setA: a1 B: a2 [
    a := a1.
    b := a2.
]

a: num [ 
    a := num.
]

b: num [ 
    b := num.
]

eval [
    b == 0 
    ifTrue: [ 'gcd ' print. a print. ' ' print. b printNl. 
              ^a ]
    ifFalse: [ 'remainder ' print. a print. ' ' print. b printNl.
              ^(Gcd new setA: b B: (a \\ b)) eval ] 
]

] "Gcd"

| test test2 |
test := (Gcd new setA: 406 B: 40) eval.
test printNl.

test2 := (Gcd new a: 406; b: 40) eval.
test2 printNl.
