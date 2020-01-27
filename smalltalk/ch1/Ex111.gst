Object subclass: Ex111 [

Ex111 class >> doWith: a second: b third: c fourth: x [
    ^ x == 3
	ifTrue: [ self singleWith: a second: b third: c ]
	ifFalse: [ self doWith: (self singleWith: a second: b third: c)
				second: a
				third: b
				fourth: x - 1 ] 
]

Ex111 class >> singleWith: a second: b third: c [
    ^ a + (2 * b) + (3 * c)
]

iterative: n [
	^ n < 3
		ifTrue: [ n ]
		ifFalse: [ (self class) doWith: 2 second: 1 third: 0 fourth: n ]
]

recursive: n [
	^ n < 3
		ifTrue: [ n ]
		ifFalse:
			[ (self recursive: n - 1) + (2 * (self recursive: n - 2)) + (3 * (self recursive: n - 3)) ]
]

] "end Ex111"

| test |

'Testing Ex111' printNl.

test := Ex111 new.

(test recursive: 2) printNl.
(test recursive: 3) printNl.
(test recursive: 4) printNl.

(test iterative: 2) printNl.
(test iterative: 3) printNl.
(test iterative: 4) printNl.
