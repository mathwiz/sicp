Object subclass: Ex116 [

raise: aBase to: anExponent [
	"do exponentiation in logarithmic time using squaring"

	| isEven iter |
	isEven := [ :x | (x rem: 2) = 0 ].
	iter := [ :b :p :a | 
	p = 0
		ifTrue: [ a ]
		ifFalse: [ (isEven value: p)
				ifTrue: [ iter value: b * b value: p / 2 value: a ]
				ifFalse: [ iter value: b value: (p - 1) value: (a*b) ] ] ].
	^ iter value: aBase value: anExponent value: 1
]

] "end Ex116"

| test isEven iter |

test := Ex116 new.

(test raise: 2 to: 3) printNl.
(test raise: 2 to: 8) printNl.
(test raise: 3 to: 3) printNl.
(test raise: 3 to: 4) printNl.

isEven := [ :x | (x rem: 2) = 0 ].
(isEven value: 3) printNl.
(isEven value: 4) printNl.

iter := 
[ :b :p :a | 
p = 0
ifTrue: [ a ]
ifFalse: [ (isEven value: p)
        	ifTrue: [ iter value: b * b value: p / 2 value: a ]
		ifFalse: [ iter value: b value: (p - 1) value: (a*b) ] ] ].

(iter value: 2 value: 3 value: 1) printNl.
(iter value: 3 value: 3 value: 1) printNl.
