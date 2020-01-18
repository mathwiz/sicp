Object subclass: Ex104 [
    | a b |

    setA: anInt [
        a := anInt.
        ^ self
    ]

    setB: anInt [
        b := anInt.
        ^ self
    ]

    plusA_B [
        ^ a + b
    ]

    plusA_absB [
        ^ (b > 0 ifTrue: [[ :y | a + y ]] ifFalse: [[ :y | a - y ]]) value: b
    ]

]

"Run with: gst Ex104.gst"
|test|

test := Ex104 new.
test setA: 1; setB: -2.
test plusA_B printNl.
test plusA_absB printNl.
