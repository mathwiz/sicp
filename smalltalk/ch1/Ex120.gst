Object subclass: Gcd [
| args |

setA: a B: b [
    args := Dictionary new.
    args at: #a put: a.
    args at: #b put: b.
]

eval [
    | a b |
    a := (args at: #a).
    b := (args at: #b).
    b == 0 
    ifTrue: [ 'gcd ' print. a print. ' ' print. b printNl. 
              ^a ]
    ifFalse: [ 'remainder ' print. a print. ' ' print. b printNl.
              ^((Gcd new) setA: b B: (a \\ b)) eval ] 
]

] "Gcd"

| test |
test := ((Gcd new) setA: 406 B: 40) eval.
test printNl.

