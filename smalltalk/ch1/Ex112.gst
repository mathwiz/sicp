Object subclass: Ex112 [

pascalRow: r element: n [
	"produce the nth element of row r in Pascal's triangle"

	| endElem |
	endElem := n == 1
		ifTrue: [ true ]
		ifFalse: [ r == n ].
	^ endElem
		ifTrue: [ 1 ]
		ifFalse: [ (self pascalRow: r - 1 element: n - 1) + (self pascalRow: r - 1 element: n) ]
]

] "end Ex112"

| test |

test := Ex112 new.

(test pascalRow: 5 element: 1) printNl.
(test pascalRow: 5 element: 2) printNl.
(test pascalRow: 5 element: 3) printNl.
(test pascalRow: 5 element: 4) printNl.
(test pascalRow: 5 element: 5) printNl.
