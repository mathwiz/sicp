Object subclass: Ex109 [

plusR: a and: b [
	"recursive plus"
	^ a==0 ifTrue: [ b ] ifFalse: [ self inc: (self plusR: (self dec: a) and: b) ]
]

plusIt: a and: b [
	"iterative plus"
	^ a==0 ifTrue: [ b ] ifFalse: [ self plusIt: (self dec: a) and: (self inc: b) ]
]

inc: x [
	^ x + 1
]

dec: x [
	^ x - 1
]

] "end Ex109"


| test |

'Testing Ex109' printNl.
test := Ex109 new.

(test plusR: 1 and: 2) printNl.
(test plusIt: 1 and: 2) printNl.

(test plusR: 301 and: 2) printNl.
(test plusIt: 301 and: 2) printNl.

'done' printNl.
