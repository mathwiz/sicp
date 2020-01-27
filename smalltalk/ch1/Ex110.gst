Object subclass: Ex110 [

ackOfX: x Y: y [
	"Ackermann's function"

y == 0 
 ifTrue: [ ^ 0 ]
 ifFalse: [ x == 0
           ifTrue: [ ^ 2 * y ]
           ifFalse: [ y == 1
                     ifTrue: [ ^ 2 ]
                     ifFalse: [ ^ self ackOfX: x - 1 Y: (self ackOfX: x Y: y - 1 ) ] ] ]
]

h: n [
	^ self ackOfX: 2 Y: n
]

k: n [
	^ 5 * n * n
]

f: n [
	^ self ackOfX: 0 Y: n
]

g: n [
	^ self ackOfX: 1 Y: n
]

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "

Ex110 class >> showSampleCalcs [
	"samples"

	(Ex110  new ackOfX: 3 Y: 3) printNl.
	(Ex110  new f: 4) printNl.
        (Ex110  new g: 4) printNl.
        (Ex110  new h: 4) printNl.
        (Ex110  new k: 4) printNl.
]

] "end Ex110"


'Testing Ex110' printNl.

Ex110 showSampleCalcs.

